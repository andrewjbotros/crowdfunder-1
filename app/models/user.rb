class User < ActiveRecord::Base

  has_many :projects, dependent: :destroy

  has_many :pledges
  has_many :breakpoints, through: :pledges
  has_many :backed_projects, through: :breakpoints, source: 'project'

  # Bcrypt Password Digest Encryption
  has_secure_password

  #  Callbacks and Validations
  before_save { email.downcase! }
  before_save { username.downcase! }
  before_create :generate_token

  validates :username,  presence: true,
                        uniqueness: {
                          case_sensitive: false,
                          message: "has already being taken"
                        }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email,     presence: true,
                        format: { with: VALID_EMAIL_REGEX },
                        uniqueness: {
                          case_sensitive: false,
                          message: "has already being registered"
                        }

  validates :password,  length: { in: 6..32 },
                        confirmation: true,
                        exclusion: {
                          in: lambda { |user| [user.username, user.email] },
                          message: "can not be the same as email"
                        }

  after_validation { self.errors.messages.delete(:password_digest) }

  # Retrieve Gravatar from gravatar.com using user email
  def gravatar(size = 60)
    return "https://secure.gravatar.com/avatar/#{Digest::MD5::hexdigest(email)}?s=#{size}"
  end

  # Class Method: Generate New Token
  def User.new_token
    SecureRandom.urlsafe_base64
  end

  # Class Method: Encrypt Token
  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  def total_pledged
    pledges.inject(0) { |sum, p| sum + p.amount }
  end

private

  # Generate and set user token before create
  def generate_token
    self.token = User.encrypt(User.new_token)
  end

end
