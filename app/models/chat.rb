class Chat < ApplicationRecord
  with_options presence: true do
    validates :chat
  end

  belongs_to :user
  belongs_to :room

end
