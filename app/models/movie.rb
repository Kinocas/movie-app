class Movie < ApplicationRecord
  with_options presence: true do
    validates :movie_title
    validates :thought
    validates :genre_id
    validates :evaluation
    validates :release 
  end
  validates :genre_id, numericality: { only_integer: true }, allow_blank: true
  validates :evaluation, numericality:{ greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }, allow_blank: true

  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre
  has_one_attached :image

end
