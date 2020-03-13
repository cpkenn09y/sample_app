require 'rails_helper'

describe WavesController, :type => :controller do

  describe "GET /big-waves" do

    before do
    end

    it "should return a success status of 200" do
      get :big_waves, {}
      expect(response).to have_http_status(200)
    end

    it "should return the url that we are targeting" do
      get :big_waves, { parameters: { sid: 46026 } }
      json = JSON.parse(response.body)
      expect(json['url']).to eql("https://www.ndbc.noaa.gov/data/realtime2/46026.txt")
    end

  end

end
