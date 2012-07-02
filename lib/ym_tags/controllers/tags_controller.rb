module YmTags::TagsController
  
  def self.included(base)
    base.expose(:current_tag) {Tag.find_by_name(params[:id])}
    base.expose(:top_tags) {Tag.most_used}
    base.autocomplete :tag, :name, :full => true
  end
  
end