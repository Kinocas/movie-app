class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true 

  has_many :movies
  #has_many :rooms
  #has_many :chats

  def self.search(search, id)
    if search != ""
      Movie.where('movie_title LIKE(?)', "%#{search}%" ).where(user_id: id)
    else
      Movie.all
    end
  end

end
