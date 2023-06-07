require "test_helper"

class EventTest < ActiveSupport::TestCase
  test "#collective returns the Collective of the person who created the Event" do
    collective = collectives(:lewagang)
    event = Event.create!(
      collective:,
      name: 'new party',
      start_time: DateTime.tomorrow,
      end_time: DateTime.tomorrow + 1
    )
    assert_equal collective, event.collective
  end

  # test '#members should return the array of members' do
  #   users = [users(:meleu), users(:marcos), users(:douglas)]
  #   collective = collectives(:lewagang)

  #   users.each do |user|
  #     Membership.create(user:, collective:)
  #   end

  #   assert_equal users, collective.members
  # end

  # test '#subscribers should return the array of subscribers' do
  #   users = [users(:meleu), users(:marcos), users(:douglas)]
  #   collective = collectives(:lewagang)

  #   users.each do |user|
  #     Subscription.create(user:, collective:)
  #   end

  #   assert_equal users, collective.subscribers
  # end
end
