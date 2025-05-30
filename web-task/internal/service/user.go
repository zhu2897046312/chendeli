package service

import (
	"errors"
	"web-task/internal/models"
	"web-task/pkg/utils/email"
	"web-task/pkg/utils/jwt"
	"time"

	"golang.org/x/crypto/bcrypt"
)

var (
	ErrUserExists  = errors.New("user already exists")
	ErrInvalidAuth = errors.New("invalid username or password")
	ErrEmailExists = errors.New("email already exists")
)

type UserService struct {
	*Service
	verificationCodes map[string]string    // 用于存储验证码
	codeExpiryTimes   map[string]time.Time // 用于存储验证码过期时间
}

type LoginResponse struct {
	User  *models.User `json:"user"`
	Token string       `json:"token"`
}

func NewUserService(base *Service) *UserService {
	return &UserService{
		Service:           base,
		verificationCodes: make(map[string]string),
		codeExpiryTimes:   make(map[string]time.Time),
	}
}

// Register 通过邮箱注册
func (s *UserService) Register(user *models.User) error {
	// 检查用户名是否已存在
	if _, err := s.repoFactory.GetUserRepository().GetByUsername(user.Nickname); err == nil {
		return ErrUserExists
	}

	// 检查邮箱是否已存在
	if _, err := s.repoFactory.GetUserRepository().GetByEmail(user.Email); err == nil {
		return ErrEmailExists
	}

	// 加密密码
	hashedPassword, err := bcrypt.GenerateFromPassword([]byte(user.Password), bcrypt.DefaultCost)
	if err != nil {
		return err
	}
	user.Password = string(hashedPassword)

	return s.repoFactory.GetUserRepository().Create(user)
}

// LoginByEmail 通过邮箱登录
func (s *UserService) Login(email, password string) (*LoginResponse, error) {
	user, err := s.repoFactory.GetUserRepository().GetByEmail(email)
	if err != nil {
		return nil, ErrInvalidAuth
	}

	if err := bcrypt.CompareHashAndPassword([]byte(user.Password), []byte(password)); err != nil {
		return nil, ErrInvalidAuth
	}

	// 生成JWT token,添加角色信息
	token, err := jwt.GenerateToken(user.ID, user.Nickname, user.Email, user.Role)
	if err != nil {
		return nil, err
	}

	return &LoginResponse{
		User:  user,
		Token: token,
	}, nil
}

// LoginByUsername 通过用户名登录
func (s *UserService) LoginByUsername(username, password string) (*LoginResponse, error) {
	user, err := s.repoFactory.GetUserRepository().GetByUsername(username)
	if err != nil {
		return nil, ErrInvalidAuth
	}

	if err := bcrypt.CompareHashAndPassword([]byte(user.Password), []byte(password)); err != nil {
		return nil, ErrInvalidAuth
	}

	// 生成JWT token,添加角色信息
	token, err := jwt.GenerateToken(user.ID, user.Nickname, user.Email, user.Role)
	if err != nil {
		return nil, err
	}

	return &LoginResponse{
		User:  user,
		Token: token,
	}, nil
}

// ValidateToken 验证token
func (s *UserService) ValidateToken(tokenString string) (*jwt.Claims, error) {
	return jwt.ParseToken(tokenString)
}

// GetUserByID 根据ID获取用户信息
func (s *UserService) GetUserByID(id uint) (*models.User, error) {
	return s.repoFactory.GetUserRepository().GetByID(id)
}

// UpdateUser 更新用户信息
func (s *UserService) UpdateUser(user *models.User) error {
	// 如果更新了密码，需要加密
	if user.Password != "" {
		hashedPassword, err := bcrypt.GenerateFromPassword([]byte(user.Password), bcrypt.DefaultCost)
		if err != nil {
			return err
		}
		user.Password = string(hashedPassword)
	}

	// 调用 repository 的 UpdateProfile 方法
	return s.repoFactory.GetUserRepository().UpdateProfile(user)
}

func (s *UserService) GetAddressByID(id uint) (*models.Address, error) {
	return s.repoFactory.GetUserRepository().GetAddressByID(id)
}

func (s *UserService) AddAddress(address *models.Address) error {
	// 检查用户是否存在
	if _, err := s.GetUserByID(address.UserID); err != nil {
		return errors.New("user not found")
	}

	// 如果是默认地址，先将其他地址设置为非默认
	if address.IsDefault {
		addresses, err := s.ListAddresses(address.UserID)
		if err != nil {
			return err
		}
		for _, addr := range addresses {
			if addr.IsDefault {
				addr.IsDefault = false
				if err := s.repoFactory.GetUserRepository().UpdateAddress(&addr); err != nil {
					return err
				}
			}
		}
	}

	return s.repoFactory.GetUserRepository().CreateAddress(address)
}

func (s *UserService) UpdateAddress(address *models.Address) error {
    return s.repoFactory.GetUserRepository().UpdateAddress(address)
}

func (s *UserService) UnsetDefaultAddresses(userID uint) error {
	return s.repoFactory.GetUserRepository().UnsetDefaultAddresses(userID)
}

func (s *UserService) SetDefaultAddress(addressID uint) error {
	return s.repoFactory.GetUserRepository().SetDefaultAddress(addressID)
}

func (s *UserService) DeleteAddress(id uint) error {
	if _, err := s.GetAddressByID(id); err != nil {
		return errors.New("address not found")
	}
	return s.repoFactory.GetUserRepository().DeleteAddress(id)
}

func (s *UserService) ListAddresses(userID uint) ([]models.Address, error) {
	return s.repoFactory.GetUserRepository().ListAddresses(userID)
}

// ListUsers 获取用户列表(仅管理员)
func (s *UserService) ListUsers(page, pageSize int) ([]models.User, int64, error) {
	return s.repoFactory.GetUserRepository().ListUsers(page, pageSize)
}

// UpdateUserByAdmin 管理员更新用户信息
func (s *UserService) UpdateUserByAdmin(user *models.User) error {
	// 如果更新了密码，需要加密
	if user.Password != "" {
		hashedPassword, err := bcrypt.GenerateFromPassword([]byte(user.Password), bcrypt.DefaultCost)
		if err != nil {
			return err
		}
		user.Password = string(hashedPassword)
	}
	return s.repoFactory.GetUserRepository().UpdateUserByAdmin(user)
}

// DeleteUser 删除用户(仅管理员)
func (s *UserService) DeleteUser(userID uint) error {
	return s.repoFactory.GetUserRepository().SoftDelete(userID)
}

// SendResetPasswordCode 发送重置密码的验证码
func (s *UserService) SendResetPasswordCode(emailAddress string) error {
	_, err := s.repoFactory.GetUserRepository().GetByEmail(emailAddress)
	if err != nil {
		return errors.New("user not found")
	}

	code := email.GenerateVerificationCode()
	s.verificationCodes[emailAddress] = code
	s.codeExpiryTimes[emailAddress] = time.Now().Add(15 * time.Minute) // 15分钟过期

	emailSender := email.NewEmailSender()
	return emailSender.SendVerificationCode(emailAddress, code)
}

// ResetPasswordByCode 通过验证码重置密码
func (s *UserService) ResetPasswordByCode(emailAddress, code, newPassword string) error {
	storedCode, exists := s.verificationCodes[emailAddress]
	if !exists || storedCode != code {
		return errors.New("ErrInvalidCode")
	}

	if time.Now().After(s.codeExpiryTimes[emailAddress]) {
		return errors.New("ErrCodeExpired")
	}

	user, err := s.repoFactory.GetUserRepository().GetByEmail(emailAddress)
	if err != nil {
		return errors.New("ErrUserNotFound")
	}

	hashedPassword, err := bcrypt.GenerateFromPassword([]byte(newPassword), bcrypt.DefaultCost)
	if err != nil {
		return err
	}

	user.Password = string(hashedPassword)
	return s.repoFactory.GetUserRepository().UpdateProfile(user)
}