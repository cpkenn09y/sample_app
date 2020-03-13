require 'rails_helper'

describe AccountsController, :type => :controller do

  describe "POST count" do

    before do
      @account = create(:account)
    end

    it "should return a success status of 200" do
      get :count, {}
      expect(response).to have_http_status(200)
    end

    it "should return a count of 1" do
      get :count, {}
      json = JSON.parse(response.body)
      expect(json['count']).to eql(1)
    end

  end

end
