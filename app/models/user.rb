class User < ActiveRecord::Base

  has_secure_password

  validates :email,
              presence: true,
              uniqueness: { case_sensitive: false },
              length: {
                minimum: 4,
                maximum: 30
              }

  validates_confirmation_of :password, on: :create
  validates_presence_of :password_confirmation

  def self.authenticate email, password
    User.find_by_email(email).try(:authenticate, password)
  end
end
