module YmTags::TagsController
  
  def self.included(base)
    base.autocomplete :tag, :name, :full => true
  end
  
  def show
    @tag = Tag.find_by_name(params[:id])
    if @tag.nil?
      raise ActiveRecord::RecordNotFound.new("Couldn't find Tag with name=#{params[:id]}")
    end    
  end
  
end