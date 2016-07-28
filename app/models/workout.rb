class Workout < ActiveRecord::Base
  belongs_to :user

  validates :duration, numericality: { only_integer: true, message: 'has to be a number' }
  validates :workout_details, presence: true
  validates :activity_date, presence: true
  validates :user_id, presence: true

  scope :last_7_days, -> { where('activity_date > ?', 7.days.ago).order(activity_date: :desc) }

end
