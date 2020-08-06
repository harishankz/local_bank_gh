require 'test_helper'

class AcccountsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @acccount = acccounts(:one)
  end

  test "should get index" do
    get acccounts_url
    assert_response :success
  end

  test "should get new" do
    get new_acccount_url
    assert_response :success
  end

  test "should create acccount" do
    assert_difference('Acccount.count') do
      post acccounts_url, params: { acccount: { account_id: @acccount.account_id, account_type: @acccount.account_type, branch: @acccount.branch, customer_id: @acccount.customer_id, customer_name: @acccount.customer_name, date: @acccount.date, minor_indicator: @acccount.minor_indicator, open_date: @acccount.open_date, string: @acccount.string } }
    end

    assert_redirected_to acccount_url(Acccount.last)
  end

  test "should show acccount" do
    get acccount_url(@acccount)
    assert_response :success
  end

  test "should get edit" do
    get edit_acccount_url(@acccount)
    assert_response :success
  end

  test "should update acccount" do
    patch acccount_url(@acccount), params: { acccount: { account_id: @acccount.account_id, account_type: @acccount.account_type, branch: @acccount.branch, customer_id: @acccount.customer_id, customer_name: @acccount.customer_name, date: @acccount.date, minor_indicator: @acccount.minor_indicator, open_date: @acccount.open_date, string: @acccount.string } }
    assert_redirected_to acccount_url(@acccount)
  end

  test "should destroy acccount" do
    assert_difference('Acccount.count', -1) do
      delete acccount_url(@acccount)
    end

    assert_redirected_to acccounts_url
  end
end
