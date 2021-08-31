class Movie < ApplicationRecord
  with_options presence: true do
    validates :movie_title
    validates :thought
    validates :evaluation
    validates :release
  end
  validates :genre_id, numericality: { other_than: 0 ,message: "can't be blank" } 

  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre
  has_one_attached :image

end
