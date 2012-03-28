require "ym_tags/engine"

module YmTags
end

require 'acts-as-taggable-on'
require 'rails3-jquery-autocomplete'

Dir[File.dirname(__FILE__) + '/ym_tags/models/*.rb'].each {|file| require file }
Dir[File.dirname(__FILE__) + '/ym_tags/controllers/*.rb'].each {|file| require file }