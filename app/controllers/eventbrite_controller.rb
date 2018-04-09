class EventbriteController < ApplicationController
  Eventbrite.token = `DMKKKZCEMF2YV6K7NKLK`

  def index
    Eventbrite.token = `DMKKKZCEMF2YV6K7NKLK`
    user = User.find_by(access_token:params[:token])
    cat = '103, 101, 110'
    Eventbrite::Event.search({categories: cat})
  end


end
