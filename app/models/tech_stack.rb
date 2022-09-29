class TechStack < ApplicationRecord
  has_many :skill_sets

  validates :stack_name, presence: true
end
