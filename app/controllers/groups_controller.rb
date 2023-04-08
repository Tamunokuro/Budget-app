class GroupsController < ApplicationController
  before_action :authenticate_user!

  # GET /groups or /groups.json
  def index
    @groups = Group.all.where(user: current_user).includes(:payments)
  end

  # GET /groups/1 or /groups/1.json
  def show
    @groups = Group.find_by(id: params[:id])
  end

  # GET /groups/new
  def new
    @group = Group.new
  end

  # POST /groups or /groups.json
  def create
    unless current_user.present?
      flash[:alert] = 'You must be logged in to create a group'
      redirect_to new_user_session_path
      return
    end
    @group = Group.new(group_params.merge(user: current_user))

    respond_to do |format|
      if @group.save
        format.html { redirect_to groups_url, notice: 'Group was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groups/1 or /groups/1.json
  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    respond_to do |format|
      format.html { redirect_to groups_url, notice: 'Group was successfully destroyed.' }
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
