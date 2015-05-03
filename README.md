# AwesomeRailsConsole

This gem was inspired by [Using pry in production](https://bugsnag.com/blog/production-pry), [jazz_hands](https://github.com/nixme/jazz_hands) and [jazz_fingers](https://github.com/plribeiro3000/jazz_fingers).

The pros of AwesomeRailsConsole are:

* Less gem dependances (Require infrequent used gems only when you want it)
* Simpler prompt modification (More like the default pry prompt you're familiar with)
* No configurable options at all (You don't need to worry about configuration)

> If you really want to do a lot of customization. You may consider just editing your `Gemfile`, `.pryrc` and `config/initializers/pry.rb`. Or fork this project.

## Features

### Show Rails env and project name in the prompt

Prevents you from accidentally changing production data to the wrong project.

![](http://i.imgur.com/fVDu0Oj.png)

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

![](http://i.imgur.com/I5zE8Jp.png)

### Print ascii table with Hirb

Helpful for exporting a set of records for documenting.

> This only works in development and test mode.

```ruby
extend Hirb::Console # include the `table` statement
Hirb::View.resize    # resize to your terminal window size

table [1, 2, 3]
table User.last(3), markdown: true
```

![](http://i.imgur.com/KRqvaBA.png)

### Debugging with pry-byebug

Put following statment (breakpoint) in your code. And execute it.

```ruby
binding.pry
```

After entering a pry debug session. Try:

```ruby
next
step
whereami
continue
```

### Walk the stack with pry-stack_explorer

In a pry debug session. Try:

```ruby
show-stack
up
down
```

### More

awesome_rails_console depends on following gems. Thus you can use all functionalities they provide.

* [pry-rails](https://github.com/rweng/pry-rails)
* [pry-byebug](https://github.com/deivid-rodriguez/pry-byebug)
* [pry-stack_explorer](https://github.com/pry/pry-stack_explorer)
* [awesome_print](https://github.com/michaeldv/awesome_print)
* [hirb](https://github.com/cldwalker/hirb)
* [hirb-unicode](https://github.com/miaout17/hirb-unicode)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'awesome_rails_console'
```

And then execute:

    $ bundle

And restart your rails console.

### For Ruby 1.9

```ruby
gem 'awesome_rails_console', github: 'ascendbruce/awesome_rails_console', branch: 'bring-your-own-debugger'
gem 'pry-debugger'
```

## Changelog

See CHANGELOG.md.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/ascendbruce/awesome_rails_console/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
