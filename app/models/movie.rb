class Movie < ApplicationRecord
  with_options presence: true do
    validates :movie_title
    #validates :image
    validates :thought
    validates :evaluation
  end
  validates :genre_id, numericality: { other_than: 0 ,message: "can't be blank" } 

  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre
  has_one_attached :image

  def self.search(search)
    if search != ""
      Movie.where('movie_title LIKE(?)', "%#{search}%")
    else
      Movie.all
    end
  end

end
