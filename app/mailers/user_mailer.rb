class UserMailer < ApplicationMailer
  default from: "notifications@example.com"

  def welcome_email
    @user = params[:user]
    @url  = "http://example.com/login"
    mail(to: @user.email_address, subject: "Welcome to My Awesome Site")
  end

  # 指定模板文件名和路径
  # def welcome_email
  #   @user = params[:user]
  #   @url  = "http://example.com/login"
  #   mail(to: @user.email_address,
  #        subject: "Welcome to My Awesome Site",
  #        template_path: "notifications",
  #        template_name: "hello")
  # end

  # 直接以内联方式呈现纯文本
  # def welcome_email
  #   @user = params[:user]
  #   @url  = "http://example.com/login"
  #   mail(to: @user.email_address,
  #        subject: "Welcome to My Awesome Site") do |format|
  #     format.html { render "another_template" }
  #     format.text { render plain: "hello" }
  #   end
  # end
end
