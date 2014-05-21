module YmTags
  module Generators
    class InstallGenerator < Rails::Generators::Base
      
      system("bundle exec rake acts_as_taggable_on_engine:install:migrations")
      
      source_root File.expand_path("../templates", __FILE__)
      desc "Installs YmTags."

      def manifest
        copy_file "models/tag.rb", "app/models/tag.rb"
        copy_file "controllers/tags_controller.rb", "app/controllers/tags_controller.rb"
      end
      
    end
  end
end
