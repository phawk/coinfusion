class RegistrationsController < ApplicationController
  def new
    @account = Account.new(account_params)
  end

  def create
    @account = Account.new(account_params)

    if @account.save
      sign_in(@account)
      redirect_to signup_success_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def account_params
    params.require(:account).permit(
      :account_type, :name, :company_number, :date_of_birth, :email, :password
    )
  rescue
    {}
  end
end
