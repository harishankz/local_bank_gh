require 'rails_helper'

module LocalBankGh
  describe User, type: :model do
    # describe "Associations" do
    #   it {should belong_to(:role)}
    #   it {should have_many(:account)}
    # end

    describe "validate_user_creation" do
      before(:each) do
        @customer_role = Role.create(role_name: "Customer", role_code: "employee_cs")
        @manager_role = Role.create(role_name: "Manager", role_code: "employee_mg")
      end

      it 'customer_creation' do
        user = User.create(user_name: "test_customer", date_of_birth: "1992-05-06", gender: "Male", phone_number: "81919191", role: @customer_role, email: "test_user@local.com", password: "123456")
        expect(user.role).to eq(@customer_role)
      end

      it 'manager_creation' do
        user = User.create(user_name: "test_customer", date_of_birth: "1992-05-06", gender: "Male", phone_number: "81919191", role: @manager_role, email: "test_user123@local.com", password: "123456")
        expect(user.role).to eq(@manager_role)
      end
    end
  end
end


