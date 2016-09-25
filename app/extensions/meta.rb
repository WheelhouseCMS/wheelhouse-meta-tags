unless defined?(CustomMetaTags::MetaExtension)
  module CustomMetaTags::MetaExtension
    extend ActiveSupport::Concern

    included do
      property :meta_custom, CustomMetaTags::MetaTags
    end
  end
end

Wheelhouse::Resource::Meta.module_eval do
  include CustomMetaTags::MetaExtension
end
