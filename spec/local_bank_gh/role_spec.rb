require 'rails_helper'
module LocalBankGh
  RSpec.describe Role, type: :model do
    # describe "Associations" do
    #   it {should have_many(:users)}
    # end

    describe "Uniqueness" do
      it {should validate_uniqueness_of(:role_name)}
      it {should validate_uniqueness_of(:role_code)}
    end

    describe "Validate Instance Methods" do
      it "validate_custom_role_returns_true" do
        @customer_role = Role.create(role_name: "Customer", role_code: "employee_cs")
        expect(@customer_role.is_a_customer_valid_role?). to be(true)
      end

      it "validate_custom_role_returns_false" do
        @manager_role = Role.create(role_name: "Manager", role_code: "employee_mg")
        expect(@manager_role.is_a_customer_valid_role?). to be(false)
      end
    end
  end
end

