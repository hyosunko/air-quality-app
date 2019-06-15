class HomeController < ApplicationController
  def index
    require 'net/http'
    require 'json'

    @url = 'http://www.airnowapi.org/aq/observation/zipCode/current/?format=application/json&zipCode=92122&distance=25&API_KEY=45B18CCD-E787-49DB-ADCC-807503B6EC50'
    @uri = URI(@url)
    @response = Net::HTTP.get(@uri)
    @output = JSON.parse(@response)

    if @output.empty?
      @final_output = "Error"
    elsif !@output
      @final_output ="Error"
    else
      @final_output = @output[0]['AQI']
    end

    case @final_output
    when 0..50
      @api_color = "green"
    when 51..100
      @api_color = "yellow"
    when 101..150
      @api_color = "orange"
    when 151..200
      @api_color = "red"
    when 201..300
      @api_color = "purple"
    when 301..500
      @api_color = "maroon"
    else
      @api_color = "gray"
    end

  end
end
