Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '1249668848512624', 'f9ca00fa7fc41f7451c70c0acc4beffa'
end