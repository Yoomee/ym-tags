class TagListInput < FormtasticBootstrap::Inputs::SelectInput

  def options
    pluralized_input_name = input_name.to_s.chomp("_list").pluralize
    super.reverse_merge(
      :multiple => true,
      :label => pluralized_input_name.humanize.capitalize,
      :collection => Tag.tag_list_options(pluralized_input_name, object, super[:tags])
    )
  end
  
  def select_html
    builder.hidden_field(input_name, :name => "#{object.class.to_s.downcase}[#{input_name}][]", :value => " ") + super
  end
  
end