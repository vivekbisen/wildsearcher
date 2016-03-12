# Wildsearcher

Search for records by specifying fields and a search term.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'wildsearcher'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install wildsearcher

## Usage

For a model `Car(id: integer, year: integer, make: string)`, you can call `Car.search_on_fields(search_fields: [year, id], search_term: "20")` and it will return expected records.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/wildsearcher. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

