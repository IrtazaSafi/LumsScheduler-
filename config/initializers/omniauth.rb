Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '1380026892298869', '689dac9f50ff49b6ace7c4f9728b5c07'
end