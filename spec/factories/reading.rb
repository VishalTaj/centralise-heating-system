FactoryBot.define do
  factory :reading do |r|
    r.association :thermostat
    r.tracking_number 1232456
    r.humidity 32.24
    r.temperature 14.34
    r.battery_charge 35
  end
end