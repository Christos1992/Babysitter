class ReservationsController < ApplicationController
 

  def new
 	@reservation = Reservation.new
  end

  def index
  	raise
    @reservations = Reservation.all
  end

  def create
 	@reservation = Reservation.new(reservation_params)
    @reservation.save
    redirect_to reservation_path(@reservation) 
  end

  def update
  	set_reservation
	@reservation.update(reservation_params)
    redirect_to reservations_path(@reservation)
  end

  def destroy
  	set_reservation
	@reservation.destroy
	redirect_to reservations_path
  end

private

def set_reservation

	@reservation = Reservation.find(params[:id])
end

def reservation_params
	params.require(:reservation).permit()
end

end
