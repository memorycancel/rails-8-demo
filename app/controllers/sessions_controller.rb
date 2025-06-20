class SessionsController < ApplicationController
  include UserAuth
  allow_unauthenticated_access only: %i[ new create ]
  rate_limit to: 10, within: 3.minutes, only: :create, with: -> { redirect_to new_session_url, alert: "Try again later." }

  def new
  end

  def create
    auth_and_redirect(params[:email_address], params[:password])
  end

  def destroy
    terminate_session
    redirect_to new_session_path
  end
end
