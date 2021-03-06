class HomeController < ApplicationController

  def index
    find_aqi
  end

  def zipcode
    find_aqi
  end

  private

  def find_aqi
    require 'net/http'
    require 'json'

    @zipcode_query = params[:zipcode] || 92122

    @url = "http://www.airnowapi.org/aq/observation/zipCode/current/?format=application/json&zipCode=#{@zipcode_query}&distance=25&API_KEY=#{AQI_API_KEY}"
    @uri = URI(@url)
    @response = Net::HTTP.get(@uri)
    @output = JSON.parse(@response)

    if @output.empty? || !@output
      @final_output = "Error"
      @final_location = "Please enter correct zipcode"
    else
      @final_output = @output[0]['AQI']
      @final_location = "This is current air quality for #{@output[0]['ReportingArea']},  #{@output[0]['StateCode']}"
    end

    case @final_output
    when 0..50
      @api_color = "green"
      @api_description = "AQI: Good (0 - 50). Air quality is considered satisfactory, and air pollution poses little or no risk."
    when 51..100
      @api_color = "yellow"
      @api_description = "AQI: Moderate (51 - 100). Air quality is acceptable; however, for some pollutants there may be a moderate health concern for a very small number of people who are unusually sensitive to air pollution."
    when 101..150
      @api_color = "orange"
      @api_description = "AQI: Unhealthy for Sensitive Groups (101 - 150) . Members of sensitive groups may experience health effects. The general public is not likely to be affected."
    when 151..200
      @api_color = "red"
      @api_description = "AQI: Unhealthy (151 - 200). Everyone may begin to experience health effects; members of sensitive groups may experience more serious health effects."
    when 201..300
      @api_color = "purple"
      @api_description = "AQI: Very Unhealthy (201 - 300). Health alert: everyone may experience more serious health effects."
    when 301..500
      @api_color = "maroon"
      @api_description = "AQI: Hazardous (301 - 500). Health warnings of emergency conditions. The entire population is more likely to be affected."
    else
      @api_color = "gray"
      @api_description = "Data not found"
    end
  end
end
