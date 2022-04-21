class SessionsController < ApplicationController
  def new
  end

  def create
    account = Account.find_by(email: params[:email])
    if account&.authenticate(params[:password])
      sign_in(account)
      redirect_to signup_success_path
    else
      flash[:signin] = "Invalid email or password"
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end
end
