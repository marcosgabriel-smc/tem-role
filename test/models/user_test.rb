require "test_helper"

class UserTest < ActiveSupport::TestCase
  name = 'meleuz'
  password = '123456'
  email = 'meleuz@temrole.org'
  minimum_user_info = { name:, password:, email: }

  test "do not accept User without a name" do
    assert_raises(ActiveRecord::NotNullViolation) do
      User.create!(password:, email:)
    end
  end

  test "create an user" do
    assert User.create(minimum_user_info)
  end
end
