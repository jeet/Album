# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_album_session',
  :secret      => 'a95212fc186d637e80ea5fde592e9158b8b0e32d81a0dd884a47dea9653b4f8ac316e29aecb8205c162cecd99a407c2868be2617bd146fb8f5b67fafdc5da8e3'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
