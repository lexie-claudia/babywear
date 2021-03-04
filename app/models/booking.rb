class Booking < ApplicationRecord
  include PgSearch::Model
  multisearchable against: [:price, :message, :start_date, :status]

  # Associations
  belongs_to :article
  belongs_to :user

  # Validations
  validates :start_date, :message, presence: true
  STATUS = %w(pending accepted declined)
  validates :status, inclusion: { in: STATUS }
  WEEKS = [2, 4, 6, 8]
  validates :number_of_weeks, inclusion: { in: WEEKS }

  # Callbacks
  before_validation :set_status, on: :create
  before_validation :set_price, on: :create

  private

  def set_status
    self.status = status.presence || 'pending'
  end

  def set_price
    self.price = self.article.price_per_month * self.number_of_weeks
  end
end
