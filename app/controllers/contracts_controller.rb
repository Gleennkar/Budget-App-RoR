class ContractsController < ApplicationController
  def new
    @current_group = Group.find(params[:group_id])
    new_contract = Contract.new
    respond_to do |format|
      format.html { render :new, locals: { contract: new_contract, current_group: @current_group } }
    end
  end

  def create
    @current_group = Group.find(params[:group_id])
    contract_params = params.require(:contract).permit(:name, :amount, group_ids: [])
    contract = Contract.new( contract_params)
    contract.user = current_user
    selected_groups = Group.find( contract_params[:group_ids].reject(&:empty?))
    selected_groups.each do |group|
      contract.groups << group unless  contract.groups.include?(group)
    end
    respond_to do |format|
      format.html do
        if  contract.save
          flash[:notice] = ' contract created successfully'
          redirect_to  group_path(@current_group)
        else
          flash.now[:alert] = ' contract could not be created'
          format.html { render :new, status: :unprocessable_entity }
        end
        end
      end
    end

end