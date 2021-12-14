class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, uniqueness: true, presence: true

  has_many :room_messages,
           dependent: :destroy

  def avatar_url
    avatar_id = 'https://img.icons8.com/color/48/000000/user-male-circle--v1.png'
  end
end
