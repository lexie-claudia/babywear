class Booking < ApplicationRecord
  before_save :default_values

  belongs_to :article
  belongs_to :user
  validates :start_date, :message, presence: true
  STATUS = %w(pending accepted declined)
  validates :status, inclusion: { in: STATUS }
  WEEKS = [2, 4, 6, 8]
  validates :number_of_weeks, inclusion: { in: WEEKS }

  private

  def default_values
    self.status = status.presence || 'pending'
  end
end
