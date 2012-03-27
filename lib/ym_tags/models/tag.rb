module YmTags::Tag
  def to_param
    url_encoded_name = name_was.blank? ? u(name) : u(name_was)
    url_encoded_name.gsub(".", "%2E")
  end
end