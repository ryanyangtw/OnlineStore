Rabl.configure do |config|
  config.include_json_root = false
  config.include_child_root = false
  
  config.cache_sources = Rails.env != 'development' # Defaults to false
  config.cache_engine = Rabl::CacheEngine.new # Defaults to Rails cache
  config.perform_caching = true

  include ActionView::Helpers::DateHelper
end



# require "#{Rails.root}/app/helpers/feeds_helper.rb"

# class Rabl::Engine
#   include Rails.application.routes.url_helpers
#   include FeedsHelper
# end