class Account::RoomsController < Account::AccountController
  after_action :set_status

  def index
    @rooms = collection
    @users = User.all_except(current_user)
    @current_user = current_user
    @room = Room.new
  end

  def new
    @room = Room.new
  end

  def show
    @room = Room.new
    @users = User.all_except(current_user)
    @current_room = resource
    @rooms = collection
    @message = Message.new
    @messages = @current_room.messages
  end

  def edit
    @room = resource
  end

  def create
    @room = current_user.rooms.build(room_params)
    @room.slug_name = @room.name
    if @room.save
      redirect_to room_path(current_user, @room)
    else
      render 'new'
    end
  end

  def update
    @room = resource
  end

  def destroy
    @room = resource
    @room.destroy
  end

  private
    def collection
      current_user.rooms
    end

    def resource
      Room.friendly.find(params[:id])
    end

    def room_params
      params.require(:room).permit(:id, :name, :status, :avatar, :avatar_cache)
    end

    def set_status
      current_user.update!(status: User.statuses[:offline]) if current_user
    end
end
