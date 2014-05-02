require 'open-uri'
require 'json'

class AddressesController < ApplicationController
  def fetch_coordinates

    if params[:location_lookup] == nil
        @address = "Chicago"
    else
        @address = params[:location_lookup]
    end
    @url_safe_address = URI.encode(@address)

    # Your code goes here.
    url = "http://maps.googleapis.com/maps/api/geocode/json?address=#{@url_safe_address}&sensor=false"
    raw_data = open(url).read
    parsed_data = JSON.parse(raw_data)
    @latitude = parsed_data["results"][0]["geometry"]["location"]["lat"]
    @longitude = parsed_data["results"][0]["geometry"]["location"]["lng"]
  end
end
