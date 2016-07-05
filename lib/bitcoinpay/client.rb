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
      self.class.post("/payment/btc", options)
    end

    def payment(payment_id)
      self.class.get("/payment/btc/#{payment_id}", {headers: headers})
    end

    def rates
      self.class.get("/rates/btc", {headers: headers})
    end

    # status=status&date_start=date_start&date_end=date_end&sort=sort&limit=limit&offset=offset
    def transaction_history(query = {})
      options = { query: query}
      options.merge!({ headers: headers })
      self.class.get("/transaction-history/", options)
    end

    def transaction(payment_id)
      self.class.get("/transaction-history/#{payment_id}", { headers: headers })
    end

    #status settlement_account settlement_currency sort limit offset date_start date_end
    def settlement_history(query = {})
      options = { query: query}
      options.merge!({ headers: headers })
      self.class.get("/settlement-history/", options)
    end

    def settlement(settlement_id)
      self.class.get("/settlement-history/#{settlement_id}", { headers: headers })
    end
  end
end
