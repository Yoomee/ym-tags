module YmTags
  module Generators
    class InstallGenerator < Rails::Generators::Base
      system("bundle exec rails generate acts_as_taggable_on:migration")
    end
  end
end
