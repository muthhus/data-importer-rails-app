module Api
  module V1
    class Api::V1::StatusController < Api::BaseController
      
      def index
        render :text => "ok"
      end

    end
  end
end
