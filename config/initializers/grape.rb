#require "#{Rails.root}/app/helpers/feeds_helper.rb"

module MyAppGrapeEntitySetup
  extend ActiveSupport::Concern

  module ClassMethods

    include Rails.application.routes.url_helpers
    #include ActionView::Helpers::DateHelper
    #include Rails.application.helpers.feeds_helper
    #include FeedsHelper
  end
end

module Grape
  class Endpoint
    include Rails.application.routes.url_helpers
    default_url_options[:host] = ::Rails.application.routes.default_url_options[:host]
  end

  class Entity
    include MyAppGrapeEntitySetup
    cattr_accessor :default_url_options do
      { host: ::Rails.application.routes.default_url_options[:host] }
    end
  end
end