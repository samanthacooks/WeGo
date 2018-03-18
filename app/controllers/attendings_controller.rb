class AttendingsController < ApplicationController
  before_action :set_attending, only: [:index, :show, :new, :edit, :create, :destroy]

  def index
    attendee = User.find_by(access_token:params[:token])
    event = Event.find_by(access_token:params[:event_token])
    attendings = attendee.attendings
    render json:attendings
  end

  def show
  end

  # GET /events/new
  def new
    @attending = Attending.new
  end


    # POST /events
  def create
    attendee = User.find_by(access_token:params[:token])
    event = Event.find_by(access_token:params[:event_token])
    attending = Attending.new(
      attendee_id: attendee.id,
      event_id: event.id)
    if attending.save
      render json: attending, status: 200
    else
      render json: attending.errors, status: 422
    end
  end

 # GET /users/1/edit
  def edit
    attendee = User.find_by(access_token:params[:token])
    event = creator.events.find_by(id:params[:id]).update_attributes(
      attendee_id: attendee.id,
      event_id: event.id)
      render json: attending, status: 200
  end

    # DELETE /users/1
  def destroy
    attending = Attending.find_by(id:params[:id]).destroy
    render json: attending
  end

  private
    def set_user
      @user = User.find_by(access_token: params[:access_token])
    end

    def attending_params
      params.require(:attending).permit(:creator_id,:event_id)
    end
end
