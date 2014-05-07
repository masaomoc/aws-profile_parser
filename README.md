# Aws::ProfileParser

Add this line to your application's Gemfile:

    gem 'aws-profileparser'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install aws-profileparser

## Installation

Add this line to your application's Gemfile:

    gem 'aws-profile_parser'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install aws-profile_parser

## Usage

You have to set ENV['AWS_CONFIG_FILE'] beofre using this gem.

```bash
$ export AWS_CONFIG_FILE=/path/to/your/config
```

And write simple code as below.

```ruby

require 'aws-profileparser'
require 'aws-sdk'

ARGV.options do |opt|
  profile = default
  opt.on('--profile PROFILE') { |v| profile = v}
  opt.parse!

  parser = ProfileParser.new
  options = parser.get(profile)

  AWS.config(options)
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/aws-profile_parser/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
