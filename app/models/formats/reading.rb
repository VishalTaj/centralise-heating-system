module Formats::Reading
  def as_json(options={})
    super.except(:id)
  end
end