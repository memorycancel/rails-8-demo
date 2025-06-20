class OauthController < ApplicationController
  include UserAuth
  allow_unauthenticated_access only: %i[ call google_callback ]

  def call
    puts @platform
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream:
          turbo_stream.redirect_to(GOOGLE_CLIENT.authorization_uri)
      end
    end
  end

  def google_callback
    emai = google_auth!
    pass = "123456"
    if not User.where({email_address: emai}).present?
      User.create! email_address: emai, password: pass
    end
    auth_and_redirect emai, pass
  end
end
