module Api
  module V1
    class Api::V1::CampaignController < Api::BaseController
      def index
        @results = Campaign.all
        @campaign = Campaign.campaign_list
      end
  
      def show
        @campaigns = Campaign.where('campaign =?',params[:id])
        @candidate = Campaign.campaign_candidates_list params[:id]
      end
      
    end
  end
end
