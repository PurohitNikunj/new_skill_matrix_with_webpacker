class SubSkillSet < ApplicationRecord
  belongs_to :skill_set
  has_many :user_sub_skills

  validates :sub_skill_name, presence: true
end
