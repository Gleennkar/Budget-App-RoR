class GroupsController < ApplicationController
  include GroupsHelper
  # GET /groups or /groups.json
  def index
    @groups = Group.all
  end

  def group_params
    params.require(:group).permit(:name, :icon).merge(author_id: current_user.id)
  end
  # GET /groups/1 or /groups/1.json
  def show
    @group = Group.find(params[:id])
    @contracts = @group.contracts.order(created_at: :desc)
    @total = group_total(@group)
  end

  # GET /groups/new
  def new
    new_group= Group.new
    respond_to do |format|
     format.html { render :new, locals: { group: new_group } }
  end

  def create
    @group = Group.new(group_params)

    respond_to do |format|
      group_params = params.require(:group).permit(:name, :icon)
    group = Group.new(group_params)
    group.user = current_user

    respond_to do |format|
      format.html do
      if @group.save
        flash[:notice] = 'group created successfully'
        redirect_to categories_path
      else
        flash.now[:alert] = 'Group could not be created'
        render :new, locals: { group: group }
      end
      end
      end
    end
  end
end
end