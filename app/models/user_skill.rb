class UserSkill < ApplicationRecord
  belongs_to :user
  belongs_to :skill_set
  has_many :user_sub_skills

  enum proficiency: { beginner: 0, intermediate: 1, advance: 2 }

  enum skill_type: { primary: 0, secondary: 1 }

  enum status: { pending: 0, approved: 1, rejected: 2 }

  validates :proficiency, :skill_type, :status, :starting_date, :last_used_date, presence: true
end
