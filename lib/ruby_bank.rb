module RubyBank
  class << self
    attr_accessor :http_client
  end

  def self.set_headers(token)
    {"Authorization"=> "Token #{token}", "Content-Type"=> "application/json" }
  end

  def self.sign_in(params)
    api_url = Rails.application.config.ruby_bank[:customer_api_endpoint] + "users/sign_in"

    RubyBank.post_request_to(api_url, params, {"Content-Type"=> "application/json"})
  end

  autoload :CustomerApi, 'ruby_bank/customer_api'
  autoload :RoleApi, 'ruby_bank/role_api'
  autoload :AccountApi, 'ruby_bank/account_api'
  #
  # self.get_response_from
  #
  # @param {String} api_url
  # @param {Hash} api_params
  # @param {Hash} headers (optional)
  #
  def self.get_response_from(api_url, api_params, headers={})
    caller_data = caller_locations(1,1)[0]
    # Unless cached
    self.call(api_url, api_params, headers, :get, caller_data)
  end

  #
  # self.post_request_to
  #
  # @param {String} api_url
  # @param {Hash} api_params
  # @param {Hash} headers (optional)
  #
  def self.post_request_to(api_url, api_params, headers={})
    caller_data = caller_locations(1,1)[0]
    self.call(api_url, api_params, headers, :post, caller_data)
  end

  #
  # self.put_request_to
  #
  # @param {String} api_url
  # @param {Hash} api_params
  # @param {Hash} headers (optional)
  #
  def self.put_request_to(api_url, api_params, headers={})
    caller_data = caller_locations(1,1)[0]
    self.call(api_url, api_params, headers, :put, caller_data)
  end

  #
  # self.patch_request_to
  #
  # @param {String} api_url
  # @param {Hash} api_params
  # @param {Hash} headers (optional)
  #
  def self.patch_request_to(api_url, api_params, headers={})
    caller_data = caller_locations(1,1)[0]
    self.call(api_url, api_params, headers, :patch, caller_data)
  end

  #
  # self.delete_request_to
  #
  # @param {String} api_url
  # @param {Hash} api_params
  # @param {Hash} headers (optional)
  #
  def self.delete_request_to(api_url, api_params, headers={})
    caller_data = caller_locations(1,1)[0]
    self.call(api_url, api_params, headers, :delete, caller_data)
  end

  private

  #
  # self.call
  #
  # @param {String} api_url
  # @param {Hash} api_params
  # @param {Hash} headers (optional)
  # @param {String} method (optional)
  #
  def self.call(api_url, api_params, headers={}, method=:get, caller_data)
    begin
      http_client = self.http_client || HTTPClient.new

      response = http_client.send(method, api_url, api_params.to_json, headers)
      puts "api_params #{api_params}"
      puts "api_params_to_json #{api_params.to_json}"
      result = {body: JSON.parse(response.body.to_s, symbolize_names: true)} rescue {body: {}}
      result.merge!({code: response.code})

      HashWithIndifferentAccess.new(result)
    rescue => exception
      response = exception
      Rails.logger.error "Exception calling API: #{response}"
      Rails.logger.error api_url_message(api_params, api_url, method) rescue ''
      {}
    end
  end
end