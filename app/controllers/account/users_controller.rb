class Account::UsersController < Account::AccountController
  def index
    @users = collection
  end

  def show
    @current_user = current_user
    @user = resource
    @rooms = rooms
    @users = collection
    @room = Room.new
    @message = Message.new
    @room_name = get_name(@user, @current_user)
    @slug_name = @user.username.downcase
    @single_room = Room.where(name: @room_name).first || Room.create_private_room([@current_user, @user], @room_name, @slug_name)
    @messages = @single_room.messages

    redirect_to room_path(@current_user, @single_room)
  end

  private

  def collection
    User.all_except(current_user)
  end

  def resource
    User.friendly.find(params[:id])
  end

  def get_name(user1, user2)
    users = [user1, user2].sort
    "private_#{users[0].id}_#{users[1].id}"
  end
end
