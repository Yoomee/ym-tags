require "erb"
module YmTags::Tag
  
  include ERB::Util
  
  def to_s
    name.gsub("-", " ")
  end
  
  def to_param
    url_encoded_name = name_was.blank? ? u(name) : u(name_was)
    url_encoded_name.gsub(".", "%2E")
  end
end