module TagsHelper
  
  def link_to_tag(tag_object, options = {})
    active = options.delete(:active)
    options[:class] = "tag #{options[:class]}".strip
    link_to(tag_object, options) do
      tag_label(tag_object, :active => active)
    end
  end
  
  def tag_label(tag_or_html, options = {})
    options[:class] = "label tag_label #{options[:class]}".strip
    if options.delete(:active)
      options[:class] << " label-success"
    end
    content_tag(:span, tag_or_html, options)
  end
  
end