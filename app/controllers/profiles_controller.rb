class ProfilesController < ApplicationController
  def index
    puts params
    @current_user = User.first
    @primary_skills =UserSkill.where(user_id: @current_user.id, skill_type:'Primary').order(:id)
    @secondary_skills = UserSkill.where(user_id: @current_user.id, skill_type:'Secondary').order(:id)
  end

  def manager
    @q = User.ransack(params[:q])
    @user = @q.result.includes(:user_skills)  
  end
end
