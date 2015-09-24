require "rails_helper"
	describe "listing campaign " do
		it "allows a user to view the campaign" do
			visit api_v1_campaign_index_path
			expect(page).to have_content("Name") 
			expect(page).to have_content("Score")
			click_link('ssss_uk_02B')
			visit api_v1_campaign_path(:id =>"ssss_uk_02B")

		end 
end