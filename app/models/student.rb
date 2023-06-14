class Student < ApplicationRecord
  before_save { self.email = email.downcase }

  has_many :score, through: :courses, dependent: :destroy
  belongs_to :department

  validates :name, presence: true
  validates :age, presence: true
  validates :matric_no, presence: true

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  validates :email, presence: true, uniqueness: { case_sensitive: false }, length: { maximum: 100 }, format: { with: VALID_EMAIL_REGEX }

  has_secure_password
end
