class User < ActiveRecord::Base
	before_save { email.downcase! }
	has_many :tickets, dependent: :destroy
	has_many :events, through: :tickets
	
	
	validates :first_name, presence: true
	validates :last_name, presence: true

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
	validates :email, presence: true, length: { maximum: 255},
                    format:     { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  has_secure_password
  validates :password, length: { minimum: 6 }, allow_blank: true

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

  def current_events
    all_tickets = Ticket.where("user_id =?", self.id)
    all_tickets.map{ |t| Event.find(t.event_id)}
               .select { |e| e.event_date < Time.now}

  end

  def past_events
    all_tickets = Ticket.where("user_id =?", self.id)
    all_tickets.map{ |t| Event.find(t.event_id)}
               .select { |e| e.event_date >= Time.now}
  end

  def has_ticket?(event_id)
    # this query returns ActionRecord::Relation which is array in 
    # case of falsity it returns empty array
    Ticket.where("event_id =? and user_id =?", event_id, self.id) != []
  end

  def self.search(search_param)
    where(:last_name => ["last_name LIKE ?", "#{search_param}"])
  end

end
