class WavesController < ApplicationController

  def big_waves
    url = "https://www.ndbc.noaa.gov/data/realtime2/#{params[:sid]}.txt"
    # make HTTP request to retrieve the data from the website
    response = Faraday.get url
    rows = response.body.split("\n")
    csv = rows.map do |row|
      row.gsub(/\s+/, ",").split(",")
    end
    header = csv.shift
    units = csv.shift
    data = csv
    # [{
    #   time: "2019-01-12",
    #   height: "2.1m"
    # }]
    time_and_heights = []
    data.each do |row|
      time = "#{row[0]}-#{row[1]}-#{row[2]}"
      height = row[8]
      if height != "MM"
        time_and_heights << {
          height: height,
          time: time
        }
      end
    end

    result = time_and_heights.sort_by do |a|
      a[:height]
    end

    render json: result.last(params[:n].to_i), status: :ok
  end

end
