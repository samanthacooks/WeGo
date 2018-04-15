module EventbriteHelper
  require 'Open-URI'
  require 'json'
  require 'pp'


  def categories
    # Construct the URL we'll be calling
    request_uri = 'https://www.eventbriteapi.com/v3/categories/?token=DMKKKZCEMF2YV6K7NKLK'
    request_query = ''
    url = "#{request_uri}#{request_query}"

    # Actually fetch the contents of the remote URL as a String.
    buffer = open(url).read

    # Convert the String response into a plain old Ruby array. It is faster and saves you time compared to the standard Ruby libraries too.
    result = JSON.parse(buffer)
    # p real_results = result["categories"]
    # Loop through each of the elements in the 'result' Array & print some of their attributes.
    categories = []

    result["categories"].each do |category|
      category.each do |id, name|
       categories["#{category["id"]}".to_i] = "#{category["name"]}"
      end
    end
  end

    def events
    # Construct the URL we'll be calling
    request_uri = 'https://www.eventbriteapi.com/v3/events/?token=DMKKKZCEMF2YV6K7NKLK'
    request_query = ''
    url = "#{request_uri}#{request_query}"

    # Actually fetch the contents of the remote URL as a String.
    buffer = open(url).read

    # Convert the String response into a plain old Ruby array. It is faster and saves you time compared to the standard Ruby libraries too.
    result = JSON.parse(buffer)
    # p real_results = result["categories"]
    # Loop through each of the elements in the 'result' Array & print some of their attributes.
    events = []

    result["events"].each do |event|
      event.each do |id, name|
       events["#{category["id"]}".to_i] = "#{category["name"]}"
      end
    end
  end


end
