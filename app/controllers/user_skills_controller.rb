class UserSkillsController < ApplicationController
  before_action :find, only: [:edit, :update]

	def new
    current_user = User.first
		@user_skill = current_user.user_skills.new
    @skill_type = 'Primary'
    @stack = SkillSet.where(department_id: current_user.department_id).pluck(:tech_stack_id).uniq
    @primary_techstacks = TechStack.where(id: @stack)
    respond_to do |format|
      format.js
      render :popup
    end
  end
  
  def secondary
    current_user = User.first
    @skill_type = 'Secondary'
		@user_skill = current_user.user_skills.new
    @primary_techstacks = TechStack.all
    respond_to do |format|
      format.js
      render :popup
    end
  end

	def create
    current_user = User.first
    @user_skill = current_user.user_skills.new(skill_params)
    @user_skill.save
    redirect_to profiles_path
	end

  def edit
    current_user = User.first
    if @user_skill.Primary?
      @stack = SkillSet.where(department_id: current_user.department_id).pluck(:tech_stack_id).uniq
      @primary_techstacks = TechStack.where(id: @stack)
      @skill_type = 'Primary'
    else
      @primary_techstacks = TechStack.all
      @skill_type = 'Secondary'
    end
    respond_to do |format|
      format.js
      render :popup
    end
  end

  def update
    current_user = User.first
    @user_skill.update(skill_params)
    redirect_to profiles_path
  end

	def edit_primaryskill
    @skill_target = params["skill_target"]
    @skill_set = SkillSet.where(tech_stack_id: params["stackId"])
    respond_to do |format|
      format.turbo_stream
    end
  end

  def skill_params
    params.require(:user_skill).permit(:proficiency, :skill_type, :starting_date, :last_used_date, :skill_set_id)
  end

  def find
    @user_skill = UserSkill.find(params[:id])
  end
end
