class AttendingsController < ApplicationController
  before_action :set_event, only: [:index, :show, :new, :edit, :update, :create, :destroy]

  def index
    attendee = User.find_by(access_token:params[:token])
    attendings = attendee.attendings
    render json:attendings
  end

  def update
    attendee = User.find_by(access_token:params[:token])
    event = Event.find_by(access_token:params[:event_token])

    attending = attendee.attendings.find_by(id:params[:id]).update_attendings(
      attendee_id: attendee.id,
      event_id: event.id)
      render json: user, status: 200
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
end
