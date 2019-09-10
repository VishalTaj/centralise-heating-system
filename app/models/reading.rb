class Reading < ApplicationRecord
  include Formats::Reading
  
  belongs_to :thermostat

  validates :tracking_number, uniqueness: { scope: :thermostat_id }
end