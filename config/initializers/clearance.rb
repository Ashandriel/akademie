Clearance.configure do |config|
  config.routes = false
  config.mailer_sender = "reply@example.com"
  config.rotate_csrf_on_sign_in = true
  config.cookie_expiration = lambda { 2.hour.from_now.cet }
end
