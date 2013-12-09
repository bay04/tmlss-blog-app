require 'rails/all'

class OverwriteGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)
  
def rm_rf_file
    remove_file"app/controllers/#{file_name}_controller.rb"
end


def generate_overwrite

   #copy_file "stylesheet.css", "public/stylesheets/#{file_name}.css"
    template "controller.rb", "app/controllers/#{file_name}s_controller.rb"
end 






end
