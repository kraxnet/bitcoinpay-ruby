# Bitcoinpay

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/bitcoinpay`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'bitcoinpay'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install bitcoinpay

## Usage

Initialize new client using your API token

    require 'bitcoinpay'
    client = Bitcoinpay::Client.new("my api token")

Get transaction history, filter only confirmed transactions

    client.transaction_history(status: "confirmed")

Create new payment request

    client.create_payment_request(
      settled_currency": "CZK",
      return_url: "https://www.mysite/bitcoin_payments/return",
      notify_url: "https://www.mysite/bitcoin_payments/notify",
      notify_email: "notify@mysite",
      price: 200,
      currency: "CZK",
      reference: "123456789",
      item: "Test item",
      description: "Test descripion"
    )

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/bitcoinpay. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
