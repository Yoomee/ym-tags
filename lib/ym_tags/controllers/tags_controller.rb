module YmTags::TagsController
  
  def self.included(base)
    base.expose(:current_tag) {
      tag = Tag.find_by_name(params[:id])
      if tag.nil?
        raise ActiveRecord::RecordNotFound.new("Couldn't find Tag with name=#{params[:id]}")
      end
      tag
    }
    base.expose(:top_tags) {Tag.most_used}
    base.autocomplete :tag, :name, :full => true
  end
  
end