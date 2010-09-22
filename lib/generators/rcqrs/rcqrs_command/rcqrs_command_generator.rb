require 'rails/generators'

class RcqrsCommandGenerator < Rails::Generators::NamedBase
  check_class_collision :suffix => 'Command'
  
  def self.source_root
    File.join(File.dirname(__FILE__), 'templates')
  end

  def create_command_file
    template 'command.rb', File.join('app/commands', class_path, "#{file_name}_command.rb")
  end

  def create_handler_file
    template 'handler.rb', File.join('app/commands/handlers', class_path, "#{file_name}_handler.rb")
  end
end