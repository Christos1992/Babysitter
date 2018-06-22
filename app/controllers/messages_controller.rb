class MessagesController < ApplicationController

  def create
    @reservation = Reservation.find(params[:reservation_id])
    @message = Message.new(message_params)
    @message.reservation = @reservation
   if @message.save
      respond_to do |format|
        format.html { redirect_to reservation_path(@reservation) } #NEED TO FIX THE PATH
        format.js  # <-- will render `app/views/messages/create.js.erb`
      end
    else
      respond_to do |format|
        format.html { render 'reservations/show' }
        format.js  # <-- idem
      end
    end

    authorize @message
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end

end
