# Capistrano::Consul

Allows capistrano to obtain the list of servers using a consul server

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'capistrano-consul'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install capistrano-consul

## Usage

In capistrano.

```ruby
require 'capistrano/consul'
```

In your code, then you can map a consul service to roles in capistrano
```ruby
consul_service 'app_server', roles %w{web app}
```

Also, you can use #consul_all_nodes to refer to every node in consul (useful for some tasks)

```ruby
consul_all_nodes roles %w{web app}
```

## Configuration
**consul_url** The api endpoint
**consul_token** The Consul token needed if an ACL is specified
**consul_ssh_gateway** You can configure an ssh gateway (i.e. a tunner that will be created before connecting to consul).

Example:
``` ruby
set :consul_url, 'http://localhost:8500'
set :consul_ssh_gateway, {
      host: your.gateway.server,
      user: ENV['USER'],
      port: 8500, (this port will be used for tunneling)
      options: {ssh options here}
    }
```
## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/capistrano-consul.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

