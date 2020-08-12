module RubyBank
  class AccountApi
    attr_accessor :token

    def initialize(token)
      @token = token
    end

    #
    # find_all
    #
    def find_all
      headers = RubyBank.set_headers(@token)
      api_url = Rails.application.config.ruby_bank[:account_api_endpoint] + "accounts"
      response = RubyBank.get_response_from(api_url, {}, headers)
      accounts = response[:body].map { |each_record| Account.new(each_record) } rescue nil
      { status: response[:code], accounts: accounts }
    end

    #
    # find
    #
    # @param {String} id
    def find(id)
      headers = RubyBank.set_headers(@token)
      api_url = Rails.application.config.ruby_bank[:account_api_endpoint] + "accounts/#{id}/"
      response = RubyBank.get_response_from(api_url, {}, headers)
      body = response[:code] == 200 ? Account.new(response[:body]) :  response[:body]
      { status: response[:code], account: body }
    end

    #
    # create
    #
    # @param {String} id
    # @param {Hash} params
    def create(params)
      headers = RubyBank.set_headers(@token)
      api_url = Rails.application.config.ruby_bank[:account_api_endpoint] + "accounts"
      response = RubyBank.post_request_to(api_url, params, headers)
      body = response[:code] == 200 ? Account.new(response[:body]) :  response[:body]
      { status: response[:code], body: response[:body] }
    end
    #
    # update
    #
    # @param {String} id
    # @param {Hash} params
    def update(params)
      headers = RubyBank.set_headers(@token)
      api_url = Rails.application.config.ruby_bank[:account_api_endpoint] + "accounts/#{params[:id]}/"
      response = RubyBank.patch_request_to(api_url, params, headers)
      body = response[:code] == 200 ? Account.new(response[:body]) :  response[:body]
      { status: response[:code], body: response[:body] }
    end
    #
    # destroy
    #
    # @param {String} id
    def destroy(id)
      headers = RubyBank.set_headers(@token)
      api_url = Rails.application.config.ruby_bank[:account_api_endpoint] + "accounts/#{id}/"
      response = RubyBank.delete_request_to(api_url, {}, headers)
      { status: response[:code], body: response[:body] }
    end
  end
end