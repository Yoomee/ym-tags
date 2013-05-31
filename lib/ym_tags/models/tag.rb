require "erb"
module YmTags::Tag
  
  include ERB::Util
  
  def self.included(base)
    base.scope :contexts, lambda {|contexts| base.joins(:taggings).where(["taggings.context IN (?)", [*contexts]]).group('tags.id')}
    base.scope :most_used, base.joins(:taggings).select("tags.*, COUNT(taggings.id) as tag_count").order('tag_count DESC').group('tags.id')
    base.scope :for_post_target, lambda {|target| base.joins(:taggings).joins("INNER JOIN posts ON (taggable_id = posts.id AND taggable_type = 'Post')").where(["posts.target_type = ? AND posts.target_id = ?", target.class.to_s, target.id])}
    base.send(:extend, ClassMethods)
  end
  
  module ClassMethods
    def tag_list_options(contexts, resource, tags = nil)
      tags ||= self.contexts(contexts)
      resource_tags = [*contexts].collect {|context| resource.send("#{context.to_s.singularize}_list")}
      (tags.collect(&:name) + resource_tags.flatten).uniq.sort
    end
  end
  
  def to_s
    if ActsAsTaggableOn::TagList.force_parameterize
      name.gsub("-", " ")
    else
      name
    end
  end
  
  def to_param
    url_encoded_name = name_was.blank? ? u(name) : u(name_was)
    url_encoded_name.gsub(".", "%2E")
  end
end