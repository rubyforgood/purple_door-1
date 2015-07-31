class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, #TODO remove registerable?
         :recoverable, :rememberable, :trackable, :validatable

  def self.lookup_user user_id
    User.find(user_id[:id].to_i)
  end

  def self.add_user user_params
    User.create!(email: user_params[:email], password: user_params[:password], first_name: user_params[:first_name], last_name: user_params[:last_name], birthdate: user_params[:birthdate])
  end
end
