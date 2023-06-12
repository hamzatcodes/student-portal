class Department < ApplicationRecord
  has_many :courses
  has_many :students
  validates :name, presence: true
  validates_uniqueness_of :name
end
