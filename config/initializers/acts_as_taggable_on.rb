module ActsAsTaggableOn
  class TagList < Array
    cattr_accessor :force_lowercase, :force_parameterize
    self.force_lowercase = false
    self.force_parameterize = false

    private
    # Remove whitespace, duplicates, and blanks.
    def clean!
      reject! { |name| name.blank? }
      map! { |name| name.strip }
      map! { |name| name.downcase } if force_lowercase
      map! { |name| name.parameterize } if force_parameterize
      map! { |name| name.gsub('_','-') }
      uniq!
    end

  end
end

ActsAsTaggableOn::Tag.remove_unused = true
ActsAsTaggableOn::TagList.force_lowercase = true
ActsAsTaggableOn::TagList.force_parameterize = true