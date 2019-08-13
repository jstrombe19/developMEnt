class Task < ApplicationRecord
  belongs_to :goals

  validates :goal_id, presence: true
end
