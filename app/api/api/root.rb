
module API
  class Root < Grape::API

    #helpers Rails.application.routes.url_helpers

    formatter :json, Grape::Formatter::Rabl

    # Notice: move rescue from :all to api/v1/defaults.rb
    #rescue_from :all, :backtrace => true do |e|
    #  Rack::Response.new( {:response_type => 'erroraaa', :response => e.message }.to_json, e.status ).finish
    #end


    # Notice: this method decide the format of error! and error_response (when I use error! to raise exception) in grape
    error_formatter :json, API::ErrorFormatter
   

    mount API::V1::Base

     
  end

  Base = Rack::Builder.new do
    use API::Logger
    run API::Root
  end

end

