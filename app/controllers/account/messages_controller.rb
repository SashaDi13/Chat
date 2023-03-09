class Account::MessagesController < Account::AccountController
  def create
    @message = current_user.messages.create(
      content: msg_params[:content],
      room_id: params[:room_id],
      image: msg_params[:image]
      )
    @current_room = Room.find(@message.room.id)
    @current_user = current_user
    @rooms = rooms
    respond_to :js, :turbo_stream
  end

  private

  def msg_params
    params.require(:message).permit(:content, :image)
  end
end
