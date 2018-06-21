class ReservationsController < ApplicationController

  before_action :find_id, only: [:show, :edit, :update, :destroy]



  def new
    @reservation = Reservation.new
    @bbsitter = Bbsitter.find(params[:bbsitter_id])
     @parent = current_user.parent
    authorize @reservation
  end

  def create
     @reservation = Reservation.new(reservation_params)
     @reservation.bbsitter = Bbsitter.find(params[:bbsitter_id])

     @reservation.parent = Parent.find(current_user.parent.id)
    authorize @reservation

    if @reservation.save
      redirect_to reservation_path(@reservation)
    else
      render 'new'
    end
  end

  def show
  end

  def index


    @reservations = policy_scope(Reservation)



  end

  def edit
  end

  def update
    @reservation.update(reservations_params)
    redirect_to reservation_path(@reservation)
  end

  def destroy
      @reservation = Reservation.find(params[:id])
    @reservation.destroy
    redirect_to reservations_path
  end

   private
  def reservation_params
    params.require(:reservation).permit(:reservation_date, :status)
  end

  def find_id
    @reservation = Reservation.find(params[:id])
    authorize @reservation
  end
end
