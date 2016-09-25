module CustomMetaTags
  class MetaTagDefinition < Wheelhouse::EmbeddedResource
    property :name, String
    property :attribute_type, Wheelhouse::Options[:name, :property, :rel], default: :name
    property :attribute_key, String
    property :value_type, Wheelhouse::Options[:text, :image], default: :text
    property :default, String

    def text?
      value_type == "text"
    end

    def image?
      value_type == "image"
    end
  end
end
