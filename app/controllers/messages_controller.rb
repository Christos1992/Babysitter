class MessagesController < ApplicationController

  def create
    @reservation = Reservation.find(params[:reservation_id])
    @message = Message.new(message_params)
    @message.reservation = @reservation
    if @message.save
      redirect_to reservation_path(@reservation)
    else
      render "reservation/show"
    end
    authorize @message
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end

end
