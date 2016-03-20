# Make Your Rails Console Awesome

This gem was inspired by [Using pry in production](https://bugsnag.com/blog/production-pry), [jazz_hands](https://github.com/nixme/jazz_hands) and [jazz_fingers](https://github.com/plribeiro3000/jazz_fingers).

The pros of `awesome_rails_console` are:

* Less gem dependances (You can remove enhancement gems easily)
* Simpler prompt modification (Closer to the default pry prompt you're familiar with)
* No need to worry about configuration (Not much configurable options available)

## TL; DR;

``` ruby Gemfile
gem 'awesome_rails_console'
```

``` sh (terminal)
bundle
rails g awesome_rails_console:install
spring stop
rails c
```

## Features

### Show Rails env and project name in the prompt

Prevents you from accidentally changing production data to the wrong project.

![](http://i.imgur.com/CKrJYqk.png)

### Beautiful formatting with pry and awesome_print

Make it easy to read. Reduce the pain while debugging.

```ruby
# Try following statements in rails console:
[:apple, :orange, :banana]
{ a: 1, b: 2, c: 3 }
1.methods
(1..100).to_a
ap (1..100).to_a, limit: 5
```

![](http://i.imgur.com/I1iV8n9.png)

### Print table in console

With Hirb (optional enhancement)

Very handy when you need to paste some data into issue tracking system.

![](http://i.imgur.com/9z3XDSU.png)

### Debugger

With pry-byebug (optional enhancement)

Insert `binding.pry` (break point) to start debugging. See [pry-byebug](https://github.com/deivid-rodriguez/pry-byebug) For detail.

![](http://i.imgur.com/mJbC24h.png)

## Installation

Add this line to your application's `Gemfile`:

```ruby
gem 'awesome_rails_console'
```

And then execute in terminal:

    $ bundle

Install and config enhancement gems: (optinal)

    $ rails generate awesome_rails_console:install

Finally, restart your rails console. (You may need to restart `spring` also)

## Changelog

See `CHANGELOG.md`.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/ascendbruce/awesome_rails_console/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
