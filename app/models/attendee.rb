class Attendee < ApplicationRecord
  belongs_to :user
  belongs_to :event

  validates :email, presence: true
end
