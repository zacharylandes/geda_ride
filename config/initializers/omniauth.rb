OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '518381331098-r818lmnhmacbc6a5nda0vkfkf4t0ds6s.apps.googleusercontent.com', "JxuqjO1gvW-ZcgTAV3U2siUi", {client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}, skip_jwt: true}

end
