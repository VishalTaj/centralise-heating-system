class Thermostat < ApplicationRecord
  has_many :readings

  before_create :generate_household_token


  protected

  def generate_household_token
    self.household_token = loop do
      random_token = SecureRandom.urlsafe_base64(nil, false)
      break random_token unless Thermostat.exists?(household_token: random_token)
    end
  end

end