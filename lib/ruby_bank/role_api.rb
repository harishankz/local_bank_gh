module RubyBank
  class RoleApi
    attr_accessor :token

    def initialize(token)
      @token = token
    end

    #
    # find_all
    #
    def find_all
      headers = RubyBank.set_headers(@token)
      api_url = Rails.application.config.ruby_bank[:customer_api_endpoint] + "roles"
      response = RubyBank.get_response_from(api_url, {}, headers)
      roles = response[:body].map { |each_record| Role.new(each_record) } rescue nil
      { status: response[:code], roles: roles }
    end

    #
    # find
    #
    # @param {String} id
    def find(id)
      headers = RubyBank.set_headers(@token)
      api_url = Rails.application.config.ruby_bank[:customer_api_endpoint] + "roles/#{id}/"
      response = RubyBank.get_response_from(api_url, {}, headers)
            body = response[:code] == 200 ? Role.new(response[:body]) : response[:body]
      { status: response[:code], role: body }
    end

    #
    # find
    #
    # @param {String} name
    def find_by_name(name)
      headers = RubyBank.set_headers(@token)
      api_url = Rails.application.config.ruby_bank[:customer_api_endpoint] + "roles/find/?role_name=#{name}"
      response = RubyBank.get_response_from(api_url, {}, headers)
      body = response[:code] == 200 ? Role.new(response[:body]) : response[:body]
      { status: response[:code], user: body }
    end

    #
    # create
    #
    # @param {String} id
    # @param {Hash} params
    def create(params)
      headers = RubyBank.set_headers(@token)
      api_url = Rails.application.config.ruby_bank[:customer_api_endpoint] + "roles"
      response = RubyBank.post_request_to(api_url, params, headers)
      body = response[:code] == 200 ? Role.new(response[:body]) : response[:body]
      { status: response[:code], body: response[:body] }
    end
    #
    # update
    #
    # @param {String} id
    # @param {Hash} params
    def update(id, params)
      headers = RubyBank.set_headers(@token)
      api_url = Rails.application.config.ruby_bank[:customer_api_endpoint] + "roles/#{id}/"
      response = RubyBank.post_request_to(api_url, params, headers)
      body = response[:code] == 200 ? Role.new(response[:body]) : response[:body]
      { status: response[:code], body: body }
    end
    #
    # destroy
    #
    # @param {String} id
    def destroy(id)
      headers = RubyBank.set_headers(@token)
      api_url = Rails.application.config.ruby_bank[:customer_api_endpoint] + "roles/#{id}/"
      response = RubyBank.post_request_to(api_url, params, headers)
      { status: response[:code], body: response[:body] }
    end
  end
end