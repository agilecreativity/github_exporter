## GithubExporter

[![Gem Version](https://badge.fury.io/rb/github_exporter.svg)](http://badge.fury.io/rb/github_exporter)
[![Dependency Status](https://gemnasium.com/agilecreativity/github_exporter.png)](https://gemnasium.com/agilecreativity/github_exporter)
[![Code Climate](https://codeclimate.com/github/agilecreativity/github_exporter.png)](https://codeclimate.com/github/agilecreativity/github_exporter)

Quickly generate the starting template for creating CLI ruby gem.
Generated template contain the simplest possible structure so that we don't have
to start from scratch.

Features:

- Test with [minitest][]
- Build with the power of [Thor][]
- Debug with pry[pry][]
- Documentation with [yard][]
- Style check with [rubocop][]
- Initial git manipulation using [grit][]

### Installation

Add this line to your application's Gemfile:

    gem 'github_exporter'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install github_exporter

### Usage

Use as library try

```ruby
require 'github_exporter'
include GithubExporter
# then call the appropriate functions
```

### Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

[thor]: https://github.com/erikhuda/thor
[minitest]: https://github.com/seattlerb/minitest
[yard]: https://github.com/lsegal/yard
[pry]: https://github.com/pry/pry
[rubocop]: https://github.com/bbatsov/rubocop
[grit]: https://github.com/mojombo/grit
