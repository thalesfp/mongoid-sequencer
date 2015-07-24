# Mongoid::Sequencer

Mongoid sequencer add increment behave like a sequence number

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'mongoid-sequencer'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mongoid-sequencer

## Usage

```ruby
class User
  include Mongoid::Document
  include Mongoid::Sequencer

  sequence :number
end

user1 = User.new
user1.number # => 1

user2 = User.new
user2.number # => 2
```

or 

```ruby
class User
  include Mongoid::Document
  include Mongoid::Sequencer

 field :number, type: Integer
end

user1 = User.new
user1.number = User.next_sequence_value(:number) # => 1

user2 = User.new
user2.number = User.next_sequence_value(:number) # => 2

user3 = User.new
user3.number = User.next_sequence_value(:number) # => 3
```

Resetting the sequence:

```ruby
User.reset_sequence(:number) # => 0
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake false` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/thalesfp/mongoid-sequencer. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

