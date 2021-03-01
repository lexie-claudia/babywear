class Article < ApplicationRecord
  has_many :bookings
  has_many_attached :photos
  belongs_to :user
  validates :name, presence: true, uniqueness: true
  GENDER = %w(girl boy)
  validates :gender, inclusion: { in: GENDER }
  SIZE = ['0-3mths', '3-6mths', '6-9mths', '9-12mths', '12-18mths', '18-24mths']
  validates :size, inclusion: { in: SIZE }
  validates :price_per_month, :details, presence: true
end
