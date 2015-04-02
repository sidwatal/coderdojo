class User < ActiveRecord::Base
	before_save { email.downcase! }
	has_many :ticket, dependent: :destroy
	has_many :events, through: :tickets
	
	
	validates :first_name, presence: true
	validates :last_name, presence: true

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
	validates :email, presence: true, length: { maximum: 255},
                    format:     { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }


  # faking if user logged in
  def logged_in?(user_id)
  	if user_id < 22
  		true
  	else
  		false
  	end
  end

  def admin?
  	return self.role == "admin"
  end

  def mentor?
  	return self.role == "mentor"
  end

end
