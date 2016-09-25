module CustomMetaTags
  class MetaTagDefinitionSet < MongoModel::Collection[MetaTagDefinition]
    include ActiveModel::Validations
    extend ActiveModel::Naming

    def self.i18n_scope
      :resource
    end

    def self.lookup_ancestors
      [self]
    end
  end
end
