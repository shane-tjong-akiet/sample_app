# Be sure to restart your server when you modify this file.

# Your secret key for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!
# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# SampleApp::Application.config.secret_token = 'b064c1a26cc8ea89a9e456272cadbfc7a62e39876bb89e2a077c8c58b494c40779758d09eff63dd7d60b688bd96fae75e76650c5ebeca954f0823733db3f82e7'
require 'securerandom'
def secure_token
  token_file = Rails.root.join('.secret')
  if File.exist?(token_file)
    # Use the existing token.
    File.read(token_file).chomp
  else
    # Generate a new token and store it in token_file.
    token = SecureRandom.hex(64)
    File.write(token_file, token)
    token
  end
end

SampleApp::Application.config.secret_key_base = secure_token