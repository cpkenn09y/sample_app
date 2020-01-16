require 'rails_helper'

RSpec.describe Account, :type => :model do

  context "initialization" do

    before do
      @account = create(:account, email: 'sample@gmail.com')
    end

    it "should have an email of 'sample@gmail.com'" do
      expect(@account.email).to eql('sample@gmail.com')
    end

  end

end
