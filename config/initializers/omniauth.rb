

OmniAuth.config.logger = Rails.logger
#config.omniauth :facebook, "159844480821795", "186777849a64f8677810989e9a57ea32"

Rails.application.config.middleware.use OmniAuth::Builder do 
  provider :facebook, '159844480821795', '186777849a64f8677810989e9a57ea32'
end

OmniAuth.config.on_failure = Proc.new do |env|
  logger.info "============= in failure"
  "AdminController".constantize.action(:omniauth_failure).call(env)
  #this will invoke the omniauth_failure action in UsersController.
end
