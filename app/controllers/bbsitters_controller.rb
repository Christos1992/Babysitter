class BbsittersController < ApplicationController
  before_action :find_id, only: [:show, :edit, :update, :destroy]

  def create
  end

  def edit


  end

  def update
    @bbsitter.update(bbsitters_params)
    redirect_to bbsitter_path(@bbsitter)
  end

  def destroy
    @bbsitter.destroy
    redirect_to bbsitters_path
  end

  def show

  end

  def bbsitters_params
   params.require(:bbsitter).permit(:first_name, :last_name, :age, :language, :price, :city, :description, :photo, :experience, :user_id)
  end

  def find_id
   @bbsitter = Bbsitter.find(params[:id])
  end

end
