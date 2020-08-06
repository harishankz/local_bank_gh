require 'rails_helper'

RSpec.describe Account, type: :model do

  describe "Associations" do
    it {should belong_to(:user).with_foreign_key(:customer_id)}
    it {should have_one(:role).through(:user)}
  end

  describe "Creation" do
    let(:customer_role){
      Role.create(role_name: "Customer", role_code: "employee_cs")
    }
    let(:customer){
      User.create(user_name: "test_customer_2", date_of_birth: "1992-05-06", gender: "Male", phone_number: "81919191", role: customer_role, email: "test_user@local.com", password: "123456")
    }
    let(:manager_role){
      Role.create(role_name: "Manager", role_code: "employee_mg")
    }
    let(:manager){
      User.create(user_name: "Test Manager", date_of_birth: "1992-05-06", gender: "Male", phone_number: "81919191", role: manager_role, email: "manager@local.com", password: "123456")
    }
    let(:minor_customer){
      User.create(user_name: "test_customer_2", date_of_birth: "2004-05-06", gender: "Male", phone_number: "81919191", role: customer_role, email: "test_user@local.com", password: "123456")
    }

    it "Should create Account for customer" do
      account = Account.create(account_type: "Savings", open_date: Date.today, customer_id: customer.id, branch: "TPVM")
      puts account.inspect
      expect(account.valid?).to be(true)
    end

    it "Shouldn't create Account for manager" do
      account = Account.create(account_type: "Savings", open_date: Date.today, customer_id: manager.id, branch: "TPVM")
      account.valid?
      expect(account.errors[:account].first).to eq("We cant create Account for Manager")
    end

    it "valid minor indicator" do
      account = Account.create(account_type: "Savings", open_date: Date.today, customer_id: customer.id, branch: "TPVM")
      expect(account.minor_indicator).to be(false)
    end

    it "minor customer" do
      account = Account.create(account_type: "Savings", open_date: Date.today, customer_id: minor_customer.id, branch: "TPVM")
      expect(account.minor_indicator).to be(true)
    end
  end
end
