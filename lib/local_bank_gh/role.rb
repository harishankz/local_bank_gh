class Role < ApplicationRecord
  has_many :users

  validates_uniqueness_of :role_name, case_sensitive: true
  validates_uniqueness_of :role_code, case_sensitive: true

  def is_a_customer_valid_role?
    ["Customer"].include? self.role_name
  end
end
