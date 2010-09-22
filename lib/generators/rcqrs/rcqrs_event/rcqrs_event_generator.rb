require 'rails/generators'

class RcqrsEventGenerator < Rails::Generators::NamedBase
  check_class_collision :suffix => 'Event'
  
  def self.source_root
    File.join(File.dirname(__FILE__), 'templates')
  end

  def create_command_file
    template 'event.rb', File.join('app/events', class_path, "#{file_name}_event.rb")
  end

  def create_handler_file
    template 'handler.rb', File.join('app/events/handlers', class_path, "#{file_name}_handler.rb")
  end
end