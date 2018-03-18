class EventsController < ApplicationController
  before_action :set_event, only: [:index, :show, :new, :edit, :update, :create, :destroy]

  def index
    creator = User.find_by(access_token:params[:token])
    events = creator.events
    render json:events
  end

  def update
    creator = User.find_by(access_token:params[:token])
    event = creator.events.find_by(id:params[:id]).update_attributes(
      event_name:params[:event_name],
      date:params[:date],
      type:params[:type],
      location:params[:location])
      render json: user, status: 200
  end

  def show
  end

  # GET /events/new
  def new
    @event = Event.new
  end


    # POST /events
  def create
    creator = User.find_by(access_token:params[:token])
    event = Event.new(
      event_name:params[:event_name],
      date:params[:date],
      type:params[:type],
      location:params[:location], 
      creator_id:creator.id
    )
    if event.save
      render json: event, status: 200
    else
      render json: event.errors, status: 422
    end
  end

 # GET /users/1/edit
  def edit
    creator = User.find_by(access_token:params[:token])
    event = creator.events.find_by(id:params[:id]).update_attributes(
      event_name:params[:event_name],
      date:params[:date],
      type:params[:type],
      location:params[:location])
      render json: user, status: 200
  end

    # DELETE /users/1
  def destroy
    event = Event.find_by(id:params[:id]).destroy
    render json: event
  end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_user
        @user = User.find_by(access_token: params[:access_token])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def events_params
        params.require(:user).permit(:event_name, :date, :type, :location)
      end
end
