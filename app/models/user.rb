class User < ActiveRecord::Base
  has_one :address
  has_many :orders
  has_many :punchclocks
 
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :authentication_keys => [:login] 
         #:omniauthable, :omniauth_providers => [:twitter, :facebook, :google_oauth2]

  # Setup accessible (or protected) attributes for your model
  attr_accessor :login 
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username, :login, :roles 
  
  def self.find_for_database_authentication(warden_conditions)
   conditions = warden_conditions.dup
   login = conditions.delete(:login)
   where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.strip.downcase }]).first
  end


  scope :with_role, lambda { |role| {:conditions => "roles_mask & #{2**ROLES.index(role.to_s)} > 0 "} }

  ROLES = %w[super admin employee]

  def roles=(roles)
     self.roles_mask = (roles & ROLES).map { |r| 2**ROLES.index(r) }.inject(0, :+)
  end

  def roles
    ROLES.reject { |r| ((roles_mask || 0) & 2**ROLES.index(r)).zero? }
  end

  def is?(role)
   roles.include?(role.to_s)
  end
      
  include AASM 
    aasm_initial_state :out
    aasm_state :in
    aasm_state :out
    aasm_event :toggle do
      transitions :to => :in, :from => [:out]
      transitions :to => :out, :from => [:in]
    end
  
  
  
  
  
  

end
 
 
