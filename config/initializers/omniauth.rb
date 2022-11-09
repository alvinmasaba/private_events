Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, Rails.application.credentials.dig(:twitter, :api_key), Rails.application.credentials.dig(:twitter, :api_secret)
  provider :discord, Rails.application.credentials.dig(:discord, :client_id), Rails.application.credentials.dig(:discord, :client_secret)
end
