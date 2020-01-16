class AccountsController < ApplicationController

  def count
    render json: { count: Account.count }, status: :ok
  end

end
