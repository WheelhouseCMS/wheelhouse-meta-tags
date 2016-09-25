module CustomMetaTags
  class Value
    def self.cast(value)
      case value
      when TextValue, ImageValue
        value
      when String
        TextValue.new(value)
      when Hash
        ImageValue.new(value)
      end
    end

    def self.from_mongo(value)
      case value
      when String
        TextValue.from_mongo(value)
      when Hash
        ImageValue.from_mongo(value)
      end
    end
  end

  class TextValue < String
    def self.from_mongo(value)
      new(value)
    end
  end

  class ImageValue < Wheelhouse::Media::ImageReference
  end

  class MetaTags < MongoModel::Map[String => Value]
  end
end
