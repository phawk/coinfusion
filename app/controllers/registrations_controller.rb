class RegistrationsController < ApplicationController
  def new
    @account = Account.new
  end

  def create
    @account = Account.new(account_params)
  end

  private

  def account_params
    params.require(:account).permit(
      :account_type, :name, :company_number, :date_of_birth, :email, :password
    )
  end
end
