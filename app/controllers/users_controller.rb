class UsersController < ApplicationController
before_action :set_user, only: [:show, :edit, :update, :destroy]

  def update
    user = User.find_by(access_token:params[:token]).update_attributes(
      name:params[:name],
      email:params[:email],
      password:params[:password],)
      render json: user, status: 200
  end

  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end


    # POST /users
  def create
    @user = User.new(user_params)
      if @user.save
        # RegistrationMailer.welcome_email(@user).deliver!
        render json: @user.access_token, status: 201
      else
        render json: @user.errors, status: 422
      end
  end

 # GET /users/1/edit
  def edit
    user = User.find_by(access_token:params[:token])
      user = {
        name: user.name,
        email: user.email,
      }
      render json: user,  status: 200
  end

    # DELETE /users/1
  def destroy
    if @user.destroy
      render json: "Account has been deleted successfully", status: 200
    else
      render json: "Something went wrong", status: 422
    end
  end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_user
        @user = User.find_by(access_token: params[:access_token])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def user_params
        params.require(:user).permit(:name, :email, :password)
      end
end
