module API
  module ErrorFormatter
    def self.call message, backtrace, options, env
      { :response_type => 'error', :response => message , :backtrace=>backtrace}.to_json
    end
  end
end