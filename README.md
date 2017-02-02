# Mikado Graph Generator [![Build Status](https://travis-ci.org/snasirca/mikado_graph_generator.svg?branch=master)](https://travis-ci.org/snasirca/mikado_graph_generator) [![Code Climate](https://codeclimate.com/github/snasirca/mikado_graph_generator/badges/gpa.svg)](https://codeclimate.com/github/snasirca/mikado_graph_generator)

Welcome to a DSL for creating Mikado Graphs using *GraphViz*.

## Installation

Add this line to your application's Gemfile:

```ruby
gem "mikado_graph"
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mikado_graph

### Prerequisites

Ensure you have *GraphViz* installed. On macOS you can install it using Homebrew with the following command:

```bash
brew install graphviz
```

## Usage

You can use this gem's DSL in the following way to create a Mikado Graph generator definition file:

```ruby
require "mikado_graph"

MikadoGraph::Generator.define do
  state("State A").depends_on {
    state("State B").depends_on {
      state("State D")
      state("State E")
    }
    state("State C").depends_on {
      state("State F")
      state("State G")
    }
  }
end.generate("png", "img/example_usage.png") # generate takes GraphViz format and output path
```

Save this file to `example_usage.rb` and then you can then execute this file in the terminal using:

```bash
ruby example_usage.rb
```

This will utilize the *GraphViz* `dot` command to create this PNG output of the above Mikado Graph generator definition:

![Example Usage](https://github.com/snasirca/mikado_graph_generator/blob/master/img/example_usage.png)

NOTE: If you don't provide any parameters to `generate`, it'll default to a `dot` output in the STDOUT.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/snasirca/mikado_graph_generator. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
