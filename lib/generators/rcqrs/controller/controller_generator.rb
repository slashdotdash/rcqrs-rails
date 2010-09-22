require 'rails/generators'

module Rcqrs
  class ControllerGenerator < Rails::Generators::NamedBase
    check_class_collision :suffix => 'Controller'
  
    def self.source_root
      File.join(File.dirname(__FILE__), 'templates')
    end

    def create_command_file
      template 'controller.rb', File.join('app/controllers', class_path, "#{file_name}_controller.rb")
    end

    def add_resource_route
      route "resource :#{file_name}, :controller => '#{file_name}'"
    end  
  end
end