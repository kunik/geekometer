class UsersSkills < ActiveRecord::Base
  belongs_to :user
  belongs_to :skill
  validates :user_id, :skill_id, presence: true
