require 'wheelhouse'

module CustomMetaTags
  class Plugin < Wheelhouse::Plugin
    isolate_namespace CustomMetaTags

    section(:configuration) {
      Section(:"configuration/meta_tags", custom_meta_tags.meta_tags_path,
        :icon => "custom-meta-tags/tag.png",
        :if   => proc { can?(:edit, site) }
      )
    }

    config.precompile << "custom-meta-tags/admin.*" << "custom-meta-tags/*.png"

    hook(:meta, "custom_meta_tags/meta")
  end
end
