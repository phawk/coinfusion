class ApplicationController < ActionController::Base
  private

  def ensure_signed_in!
    redirect_to root_path unless current_account
  end

  def current_account
    if session[:account_id]
      Account.find_by(id: session[:account_id])
    end
  end
  helper_method :current_account

  def sign_in(account)
    session[:account_id] = account.id
  end

  def sign_out
    session[:account_id] = nil
  end
end
