module YmTags::TagsController
  
  def self.included(base)
    base.expose(:current_tag) {Tag.find_by_name(params[:id])}
    base.expose(:top_tags) {Tag.scoped}    
  end
  
end