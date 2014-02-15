OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '609719912434364', '6999366a2758cab8e1df13ec28cf6f94'
end



