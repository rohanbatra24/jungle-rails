class User < ActiveRecord::Base

  def self.authenticate_with_credentials(email,password)
    user = User.find_by_email(email.downcase.strip)
    # If the user exists AND the password entered is correct.
    if user && user.authenticate(password)
        return user
    else 
        return nil
    end
  end

  has_secure_password

  validates :email, presence:true, uniqueness: { case_sensitive: false }
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password, length: { minimum: 6 }
  validates :password_confirmation, presence: true

end
