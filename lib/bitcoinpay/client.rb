require "httparty"

module Bitcoinpay
  class Client
    include HTTParty
    base_uri 'https://www.bitcoinpay.com/api/v1'
    # debug_output $stdout

    def initialize(token)
      @token = token
    end

    def headers
      {
        'Content-Type' => 'application/json',
        'Authorization' => "Token #{@token}"
      }
    end

    def create_payment_request(values)
      options={body: values.to_json, headers: headers}
      output = self.class.post("/payment/btc", options)
    end

    # status=status&date_start=date_start&date_end=date_end&sort=sort&limit=limit&offset=offset
    def transaction_history(query = {})
      options = { query: query}
      options.merge!({ headers: headers })
      output = self.class.get("/transaction-history/", options)
    end
  end
end
