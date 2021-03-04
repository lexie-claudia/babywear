class Article < ApplicationRecord
  include PgSearch::Model
  multisearchable against: [:bookings, :gender, :size, :price_per_month, :details]

  has_many :bookings, dependent: :destroy
  has_many_attached :photos
  belongs_to :user
  validates :name, presence: true, uniqueness: true
  GENDER = %w(girls boys unisex)
  validates :gender, inclusion: { in: GENDER }
  SIZE = ['0-3mths', '3-6mths', '6-9mths', '9-12mths', '12-18mths', '18-24mths']
  validates :size, inclusion: { in: SIZE }
  validates :price_per_month, :details, presence: true
end
