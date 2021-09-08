class Room < ApplicationRecord
  with_options presence: true do
    validates :room_name
    validates :purpose
  end

  belongs_to :user

end
