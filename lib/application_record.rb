# app/models/application_record.rb
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  before_create :assign_uuid

  def assign_uuid
    self.write_attribute(self.class.primary_key.to_sym, SecureRandom.uuid)
  end
end