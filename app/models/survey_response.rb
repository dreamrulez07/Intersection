class SurveyResponse < ActiveRecord::Base
  belongs_to :surveyable, :polymorphic => true
  belongs_to :survey
  belongs_to :user
  scope :active, where("expires_on > ?", Time.now)
  validates_presence_of :survey_id, :user_id, :expires_on, :surveyable_id, :surveyable_type
  validates_uniqueness_of :code
end
