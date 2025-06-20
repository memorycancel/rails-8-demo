module UserAuth
  extend ActiveSupport::Concern

  def google_auth!
    require 'google/apis/oauth2_v2'
    GOOGLE_CLIENT.code = params['code']
    GOOGLE_CLIENT.fetch_access_token!
    # 获取 email
    oauth2 = Google::Apis::Oauth2V2::Oauth2Service.new
    oauth2.authorization = GOOGLE_CLIENT
    user_info = oauth2.get_userinfo
    user_info.email
  end

  def auth_and_redirect emai, pass
    if @user = User.authenticate_by(email_address: emai, password: pass)
      start_new_session_for @user
      # Tell the UserMailer to send a welcome email after save
      UserMailer.with(user: @user).welcome_email.deliver_later
      redirect_to after_authentication_url
    else
      redirect_to new_session_path, alert: "Try another email address or password."
    end
  end
end
