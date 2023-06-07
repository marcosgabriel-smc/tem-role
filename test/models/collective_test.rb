require "test_helper"

class CollectiveTest < ActiveSupport::TestCase
  test "#owner should return the User who created the collective" do
    user = users(:meleu)
    collective = Collective.new(owner: user, name: 'mz')
    collective.save
    assert_equal user, collective.owner
  end

  test '#members should return the array of members' do
    users = [users(:meleu), users(:marcos), users(:douglas)]
    collective = collectives(:lewagang)

    users.each do |user|
      Membership.create(user:, collective:)
    end

    assert_equal users, collective.members
  end

  test '#subscribers should return the array of subscribers' do
    users = [users(:meleu), users(:marcos), users(:douglas)]
    collective = collectives(:lewagang)

    users.each do |user|
      Subscription.create(user:, collective:)
    end

    assert_equal users, collective.subscribers
  end
end
