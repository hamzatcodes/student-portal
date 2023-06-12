class Course < ApplicationRecord
  belongs_to :department
  has_many :scores, through: :department, dependent: :destroy

  validates :title, presence: true
end
