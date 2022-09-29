class UserSubSkillsController < ApplicationController
  before_action :user_skill_params
  before_action :find, only: [:edit, :update]
  def new
    @user_sub_skill = @user_skill.user_sub_skills.new
    respond_to do |format|
      format.js
      render :'user_skills/popup'
    end
  end

  def create
    @user_sub_skill = @user_skill.user_sub_skills.new(sub_skill_params)
    @user_sub_skill.save
    redirect_to profiles_path
  end

  def edit
    respond_to do |format|
      format.js
      render :'user_skills/popup'
    end
  end

  def update
    @user_sub_skill.update(sub_skill_params)
    redirect_to profiles_path
  end

  def sub_skill_params
    params.require(:user_sub_skill).permit(:proficiency,:user_skill_id, :starting_date, :last_used_date, :sub_skill_set_id)
  end

  def user_skill_params
    @user_skill = UserSkill.find(params[:user_skill_id])
  end

  def find
    @user_sub_skill = UserSubSkill.find(params[:id])
  end

end
