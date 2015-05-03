require "pry-rails"
require "awesome_print"

if Rails.env.development? || Rails.env.test?
  require "pry-stack_explorer"
  require "hirb"
  require "hirb-unicode"
end

module AwesomeRailsConsole
  class Railtie < Rails::Railtie
    initializer "awesome_rails_console.initialize" do |app|
      disables_pry_plugin_loading
      use_awesome_print_for_formatting
      set_prompt_name_to_project_name
      show_rails_env_name_before_prompt
    end

    private

    def disables_pry_plugin_loading
      Pry.config.should_load_plugins = false
    end

    def use_awesome_print_for_formatting
      AwesomePrint.pry!
    end

    def set_prompt_name_to_project_name
      Pry.config.prompt_name = Rails.application.class.parent_name.underscore.dasherize
    end

    def show_rails_env_name_before_prompt
      old_prompt = Pry.config.prompt

      # TODO: Change to Pry::Helpers::Text.red/red/yellow(...) someday.
      # See https://github.com/pry/pry/issues/493 for detail.
      env = if Rails.env.production?
              "\001\e[0;31m\002#{Rails.env.upcase}\001\e[0m\002"
            elsif Rails.env.development?
              "\001\e[0;32m\002#{Rails.env.upcase}\001\e[0m\002"
            else
              "\001\e[0;33m\002#{Rails.env.upcase}\001\e[0m\002"
            end

      Pry.config.prompt = [
        proc { |*a| "#{env} #{old_prompt.first.call(*a)}"  },
        proc { |*a| "#{env} #{old_prompt.second.call(*a)}" }
      ]
    end
  end
end
