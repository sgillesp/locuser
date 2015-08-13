# Locuser

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/locuser`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'locuser'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install locuser

An alternative to installing the gem directly is to use the git
repository referenced  in your Gemfile, with a  declaration such as:

```ruby
gem 'locuser',  '~> version', :github => 'sgillesp/locuser', :branch => 'master'
```

To use a local repository do:

```ruby
gem 'locuser', :path => '/path/to/local/gem'
```
or
```ruby
gem 'locuser', :git => '/path/to/local/git/repo'
```

If you are trying to work on the gem integrated into another gem underdevelopment,
(i.e. a .gemspec file), the above will not fly. You can use the option to link to
a remote (GitHub) repository above, and then perform the following command (CLI):

```CLI
bundle config local.locuser /path/to/local/git/repo
```

## Usage

TODO: Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake rspec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/locuser. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
