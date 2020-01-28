# bitly-client

bitly-client is a client library for [Bitly API](https://bitly.com).

Now support [V4 shorten API](https://dev.bitly.com/v4/) only.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'bitly-client'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install bitly-client

## Usage

```ruby
Bitly.configure do |config|
  config.api_version = 'v4'
  config.access_token = 'your access_token provided by bitly'
end

bitlink = Bitly.shorten('https://www.google.com')
bitlink.id #=> bit.ly/2Oh32A7
bitlink.short_url #=> http://bit.ly/2Oh32A7
bitlink.long_url #=> https://www.google.com
```

or

```ruby
client = Bitly::V4::Client.new('your access token')
bitlink = client.shorten('https://www.google.com')
bitlink.id #=> bit.ly/2Oh32A7
bitlink.short_url #=> http://bit.ly/2Oh32A7
bitlink.long_url #=> https://www.google.com
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/bitly-client. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/bitly-client/blob/master/CODE_OF_CONDUCT.md).


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Bitly::Client project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/bitly-client/blob/master/CODE_OF_CONDUCT.md).
