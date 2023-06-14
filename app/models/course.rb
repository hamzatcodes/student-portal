class Course < ApplicationRecord
  belongs_to :department
  has_many :scores, through: :student, dependent: :destroy

  validates :title, presence: true
end
