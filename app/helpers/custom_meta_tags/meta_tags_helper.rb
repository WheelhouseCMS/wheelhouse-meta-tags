module CustomMetaTags::MetaTagsHelper
  def meta_tags_custom
    tags = site.custom_meta_tags.map do |definition|
      if respond_to?(:node) && node.has_meta? && node.meta_custom[definition.attribute_key].present?
        value = node.meta_custom[definition.attribute_key].presence
        value = value.url if value && definition.image?
      end

      if value = value.presence || definition.default.presence
        tag(:meta, definition.attribute_type => definition.attribute_key, :content => value)
      end
    end

    safe_join(tags.compact, "\n")
  end

  def meta_tags
    safe_join([super, meta_tags_custom], "\n")
  end
end
