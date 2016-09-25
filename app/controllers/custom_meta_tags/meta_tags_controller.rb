class CustomMetaTags::MetaTagsController < Wheelhouse::ResourceController
  self.responder = Wheelhouse::Admin::ResourceResponder
  self.section = :"configuration/meta_tags"

  before_action :load_site
  before_action :load_meta_tags

  breadcrumb { ["Custom Meta Tags", meta_tags_path] }

  load_and_authorize_resource :site, :class => Wheelhouse::Site

  def index
    authorize!(:edit, site)
  end

  def update
    site.custom_meta_tags = sorted_meta_tags
    site.save

    respond_with(site.custom_meta_tags)
  end

protected
  def load_site
    @site = site
  end

  def load_meta_tags
    @meta_tags = site.custom_meta_tags
  end

  def resource_collection_name
    :meta_tags
  end

  def sorted_meta_tags
    meta_tags = params[:site][:custom_meta_tags] if params[:site]
    (meta_tags || []).sort { |(a, _), (b, _)| a.to_i <=> b.to_i }.map(&:last)
  end
end
