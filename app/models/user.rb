class User < ActiveRecord::Base
	def login=(login)
    @login = login
  end

  def login
    @login || self.username || self.email
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

 	def self.find_first_by_auth_conditions(warden_conditions)
  	conditions = warden_conditions.dup
  	if login = conditions.delete(:login)
    	where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
  	else
    	where(conditions).first
  	end
	end

  validates :username, presence: true, length: {maximum: 225}, 
        uniqueness: { case_sensitive: false }, 
        format: { with: /\A[a-zA-Z0-9]*\z/, message: "May only contain letters and numbers." }

end

class AddAdminToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :admin, :boolean, :default => false
  end

  def self.down
    remove_column :users, :admin
  end
end