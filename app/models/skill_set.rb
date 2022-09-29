class SkillSet < ApplicationRecord
  belongs_to :department
  belongs_to :tech_stack
  has_many :user_skills
  has_many :users, through: :user_skills
  has_many :sub_skill_set

  validates :skill_name, presence: true
end
