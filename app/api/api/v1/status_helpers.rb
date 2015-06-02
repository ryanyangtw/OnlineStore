module API
  module V1
    module StatusHelpers


        def error_message(message, staus_code)
          error!( message , staus_code)
        end

        def success_message(message)
          status 200
          {response_type: "success", response: message }  
        end


    end
  end
end