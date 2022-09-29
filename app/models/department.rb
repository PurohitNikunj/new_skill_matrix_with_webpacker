class Department < ApplicationRecord
  has_many :users
  has_many :skill_sets

  validates :department_name, presence: true
end
