module YmTags::TagsHelper
  
  def link_to_tag(tag_object, options = {})
    tag_object = tag_object.to_tag
    active = options.delete(:active)
    options[:class] = "tag #{options[:class]}".strip
    label_options = options.delete(:label_options) || {}
    link_to(tag_object, options) do
      tag_label(tag_object, label_options.merge(:active => active))
    end
  end
  
  def tag_label(tag_or_html, options = {})
    options[:method] ||= :to_s
    tag_or_html = tag_or_html.to_s.send(options[:method]) if tag_or_html.is_a?(Tag)
    options[:class] = "label tag-label #{options[:class]}".strip
    if options.delete(:active)
      options[:class] << " label-success"
    end
    content_tag(:span, tag_or_html, options)
  end
  
  def tag_list_options(context, resource, tags = nil)
    tags ||= Tag.contexts(context)
    (tags.collect(&:name) + resource.send("#{context.to_s.singularize}_list")).uniq.sort
  end  
  
end