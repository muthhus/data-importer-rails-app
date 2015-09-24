require "rails_helper"
	describe "View campaign " do
		it "allows a user to view the campaign" do
			visit api_v1_campaign_path(:id =>"ssss_uk_02B")
			 @campaigns = Campaign.find_by_campaign("ssss_uk_02B")
			 expect(page).to have_selector(
			"#candidate_count .name", text: "Antony") 
			expect(page).to have_selector(
"#candidate_count .during", text: "24")
			expect(page).to have_content("Candidate Name") 
			expect(page).to have_content("Scores")
		end 
end