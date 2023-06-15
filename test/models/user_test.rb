require "test_helper"

class UserTest < ActiveSupport::TestCase
  username = 'meleuz'
  password = '123456'
  email = 'meleuz@temrole.org'
  minimum_user_info = { username:, password:, email: }

  test "creating an user without a name defaults to the email's username" do
    user = User.create!(password:, email:)
    assert_equal user.username, email.gsub(/@.*/, '')
  end

  test "create an user" do
    assert User.create(minimum_user_info)
  end
end
