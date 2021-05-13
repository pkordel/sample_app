ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"
require "minitest/reporters"
Minitest::Reporters.use!

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all
  include ApplicationHelper

  # Add more helper methods to be used by all tests here...
  def signed_in?
    !session[:user_id].nil?
  end

  def sign_in_as(user)
    session[:user_id] = user.id
  end
end

class ActionDispatch::IntegrationTest
  def sign_in_as(user, password: 'secret', remember_me: '1')
    post signin_path, params: {
      session: {
        email: user.email,
        password: password,
        remember_me: remember_me
      }
    }
  end
end
