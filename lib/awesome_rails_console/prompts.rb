require "pry-rails"

module AwesomeRailsConsole
  module Prompts
    def self.choose_prompt_for_pry_version
      old_prompt = Pry.config.prompt

      Pry.config.prompt = if Pry::VERSION && (Gem::Version.new(Pry::VERSION) >= Gem::Version.new('0.13.0'))
        post_pry_13_prompt(old_prompt)
      else
        pre_pry_13_prompt(old_prompt)
      end
    end

    # Define a custom prompt using pre pry-0.13.0 syntax
    def self.pre_pry_13_prompt(old_prompt)
      [
        proc { |*a| "#{Rails.env.classify} #{old_prompt.first.call(*a)}"  },
        proc { |*a| "#{Rails.env.classify} #{old_prompt.second.call(*a)}" }
      ]
    end

    # Pry 0.13.0 introduces new syntax for registering a prompt.
    # https://github.com/pry/pry/wiki/Customization-and-configuration#Config_prompt
    def self.post_pry_13_prompt(old_prompt)
      Pry::Prompt.new(
        :awesome_rails_console, # name
        "awesome_rails_console default prompt", # description
        [
          proc { |*a| # "main" prompt
            "#{Rails.env.classify} #{old_prompt.wait_proc.call(*a)}"
          },
          proc { |*a| # "wait" prompt (multiline input continuation)
            "#{Rails.env.classify} #{old_prompt.incomplete_proc.call(*a)}"
          }
        ]
      )
    end
  end
end
