Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, Rails.application.secrets.facebook_app_id, Rails.application.secrets.facebook_secret,
           :scope => 'email,user_birthday', :display => 'popup'
end

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, ENV["TWIITER_API_KEY"], ENV["TWITTER_SECRET"]
end
