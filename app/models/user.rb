class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me

  has_one :profile
  has_many :team_users, :dependent => :destroy
  has_many :teams, :through => :team_users
  has_many :project_users, :dependent => :destroy
  has_many :projects, :through => :project_users
  has_many :activities
  has_many :survey_responses, :dependent => :destroy
  has_many :surveys, :as => :surveyable, :class_name => "SurveyResponse"
end
