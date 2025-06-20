# https://github.com/googleapis/signet
require 'signet/oauth_2/client'

local_redirect_uri = "http://127.0.0.1:3000/oauth/google_callback"
if ENV["RAILS_ENV"] == "production"
  local_redirect_uri = "?"
end

GOOGLE_CLIENT = Signet::OAuth2::Client.new(
  :authorization_uri => 'https://accounts.google.com/o/oauth2/auth',
  :token_credential_uri =>  'https://oauth2.googleapis.com/token',
  :client_id => ENV["GOOGLE_CLIENT_ID"],
  :client_secret => ENV["GOOGLE_CLIENT_SECRET"],
  :scope => 'email profile',
  :redirect_uri => local_redirect_uri
)
