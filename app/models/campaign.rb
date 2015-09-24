class Campaign < ActiveRecord::Base
  scope :campaign_listu, lambda { |d| where("campaign like ?",d) }
  scope :campaign_count, lambda { |d| where("campaign like ?",d).count }
  scope :campaign_during, lambda {  |d| where("campaign like ? and validity like 'during'",d).count }
  scope :campaign_pre, lambda {  |d| where("campaign like ? and validity like 'pre'",d).count }
  scope :campaign_post, lambda {  |d| where("campaign like ? and validity like 'post'",d).count }
  scope :candidate_vote, lambda { |a,b| where("campaign like ? and choice like ?",a,b)}
  
  scope :pre_and_post, lambda { where("validity like 'post' or validity like 'pre'") }
  scope :during, lambda { where("validity like 'during'") }
  
  scope :pre_and_post_final, lambda {|a,b| candidate_vote(a,b).merge(pre_and_post) }
  scope :during_final, lambda {|a,b| candidate_vote(a,b).merge(during) }
  
  def self.campaign_list
    self.all.map(&:campaign).uniq
  end
  
  def self.campaign_candidates_list c
    self.campaign_listu(c).map(&:choice).uniq
  end

end
