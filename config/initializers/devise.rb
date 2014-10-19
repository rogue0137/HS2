# Use this hook to configure devise mailer, warden hooks and so forth.
# Many of these configuration options can be set straight in your model.
Devise.setup do |config|
  
  config.mailer_sender = 'please-change-me-at-config-initializers-devise@example.com'
  require 'devise/orm/active_record'
  config.authentication_keys = [ :login ]
  config.case_insensitive_keys = [ :email ]
  config.strip_whitespace_keys = [ :email ]
  config.skip_session_storage = [:http_auth]
  config.stretches = Rails.env.test? ? 1 : 10
  config.reconfirmable = true
  config.expire_all_remember_me_on_sign_out = true
  # Range for password length.
  config.password_length = 8..128
  # Reset password needs username
  config.reset_password_keys = [ :login ]
  config.confirmation_keys = [ :login ]
  # Defines which key will be used when recovering the password for an account
  config.reset_password_keys = [ :login ]
  # Time interval you can reset your password with a reset password key.
  # Don't put a too small interval or your users won't have the time to
  # change their passwords.
  config.reset_password_within = 23.hours
  # The default HTTP method used to sign out a resource. Default is :delete.
  config.sign_out_via = :delete
end
