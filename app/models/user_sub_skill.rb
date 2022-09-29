class UserSubSkill < ApplicationRecord
  belongs_to :user_skill
  belongs_to :sub_skill_set

  enum :proficiency, [ :Beginner , :Intermediate, :Advance ]
  enum :status, [ :Pending, :Approved , :Rejected ]

  validates :proficiency, :status, :starting_date, :last_used_date, presence: true
end
