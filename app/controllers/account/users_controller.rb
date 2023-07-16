class Account::UsersController < Account::AccountController
  def index
    @users = collection
  end

  private

  def collection
    User.all_except(current_user)
  end
end
