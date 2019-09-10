FactoryBot.define do
  factory :thermostat do |t|
    t.location { "test comment_#{SecureRandom.hex(4)}" }
  end
end