class User < ApplicationRecord
  belongs_to :department
  has_many :user_skills
  has_many :skill_sets, through: :user_skills

  enum designation: { "trainee engineer": 0, "jr.software engineer": 1, "software engineer": 2 }

  enum role: { employee: 0, "team manager": 1, admin: 2 }

  validates :name, :email, :phone_number, :designation, :career_start_date, :drop_in_career, :about, :role, presence: true
  validates :phone_number, numericality: { only_integer: true }, length: { is: 10 }
end
