class ParentsController < ApplicationController
 before_action :find_id, only: [:show, :edit, :update, :destroy]
  def edit

  end

  def show
  end

  def update
    @parent.update(parents_params)
    redirect_to parent_path(@parent)
  end

  def destroy
  	@parent.update
    redirect_to parents_path
  end

  private 
  def parents_params
  	params.require(:parent).permit(:first_name, :last_name, :name_of_kid, :age_of_kid)
  end

  def find_id
  	@parent =Parent.find(params[:id])
  end

end
