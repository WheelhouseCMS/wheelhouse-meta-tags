# Admin routes (scoped to /admin)
CustomMetaTags::Plugin.routes.draw do
  extend Wheelhouse::RouteExtensions

  resource :meta_tags, :path => "site/meta-tags" do
    get :index
  end
end
