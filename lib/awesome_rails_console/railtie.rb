require "pry-rails"
require "awesome_print"

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

      Pry.config.prompt = [
        proc { |*a| "#{Rails.env.classify} #{old_prompt.first.call(*a)}"  },
        proc { |*a| "#{Rails.env.classify} #{old_prompt.second.call(*a)}" }
      ]
    end
  end
end
