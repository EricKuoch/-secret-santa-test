class Event < ApplicationRecord
  belongs_to :user
  has_many :attendees

  validates :title, presence: true
  validates :description, presence: true
  validates :date, presence: true
end

