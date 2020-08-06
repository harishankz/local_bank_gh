class Account < ApplicationRecord
  belongs_to :user, class_name: "User", foreign_key: :customer_id
  has_one :role, through: :user

  validates_presence_of :user, :role, :customer_id
  validate :customer_type
  before_save :set_minor_indicator

  private
  #
  # customer_type
  #
  def customer_type
    return true if attribute_present?("customer_id") && role.is_a_customer_valid_role?
    return false if customer_id.blank?
    errors.add(:account, "We cant create Account for Manager")
    return false
  end

  #
  # age
  #
  def age
    age = (Date.today.year - self.user.date_of_birth.year)
    age -= 1 if Date.today < self.user.date_of_birth + age.years

    age
  end

  #
  # set_minor_indicator
  #
  def set_minor_indicator
    self.minor_indicator = age < 18 ? true : false
  end
end
