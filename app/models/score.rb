class Score < ApplicationRecord
  belongs_to :student
  belongs_to :course
  validates :number, presence: true
end
