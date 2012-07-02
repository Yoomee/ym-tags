require "erb"
module YmTags::Tag
  
  include ERB::Util
  
  def self.included(base)
    base.scope :contexts, lambda {|contexts| base.joins(:taggings).where(["taggings.context IN (?)", [*contexts]]).group('tags.id')}
    base.scope :most_used, base.joins(:taggings).select("tags.*, COUNT(taggings.id) as tag_count").order('tag_count DESC').group('tags.id')
  end
  
  def to_s
    name.gsub("-", " ")
  end
  
  def to_param
    url_encoded_name = name_was.blank? ? u(name) : u(name_was)
    url_encoded_name.gsub(".", "%2E")
  end
end