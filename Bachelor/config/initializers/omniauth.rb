OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '1500146460280124', '2637be3bdc90dbfa47c3b648d553d47f', {:client_options => {:ssl => {:ca_file => Rails.root.join("cacert.pem").to_s}}}
end
