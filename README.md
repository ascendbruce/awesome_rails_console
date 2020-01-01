# Make Your Rails Console Awesome

This gem was inspired by [Using pry in production](https://bugsnag.com/blog/production-pry), [jazz_hands](https://github.com/nixme/jazz_hands) and [jazz_fingers](https://github.com/plribeiro3000/jazz_fingers).

The pros of `awesome_rails_console` are:

* Less gem dependances (Only pry-rails and awesome_print other than rails. The rest are optional)
* Simpler prompt modification (Similar to the default prompt you're already familiar with)
* No need to worry about configuration (because there are not much options anyway)

## Installation

Gemfile:

``` ruby
gem 'awesome_rails_console'
```

In terminal:

``` sh
bundle
rails g awesome_rails_console:install # This will include dependency gems to the gemfile
# you should review your Gemfile at this point (and adjust if needed)
```

```sh
bundle
spring stop # to restart spring, if you are using it
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
