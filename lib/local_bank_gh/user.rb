class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable
  belongs_to :role

  has_many :account, foreign_key: :customer_id

  validates_presence_of :gender

  def generate_jwt
    token = JWT.encode({ id: id,
                 exp: 60.days.from_now.to_i },
               Rails.application.secrets.secret_key_base)
    update_attribute(:token, token)

    token
  end
end
