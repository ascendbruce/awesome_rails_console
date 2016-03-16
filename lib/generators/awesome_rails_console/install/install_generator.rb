require 'rails/generators/base'

class AwesomeRailsConsole::InstallGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)

  def update_gemfile
    gem_group :development, :test do
      gem 'hirb'
      gem 'hirb-unicode'
      gem 'pry-byebug'
      gem 'pry-stack_explorer'
    end

    inject_into_file 'Gemfile', indication, before: gem_group_declaration
  end

  def write_to_pryrc_file
    copy_file '.pryrc', '.pryrc'
  end

  private

  def indication
     "# Please clean up duplicated gems if any.\n"\
       "# Feel free to remove gems that you don't want to use or "\
       "if they conflict with other gem dependencies. "\
       "(you might need to update .pryrc also)\n"
  end

  def gem_group_declaration
    "group :development, :test do\n"\
      "  gem 'hirb'\n"
  end
end
