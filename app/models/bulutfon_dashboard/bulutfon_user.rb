module BulutfonDashboard
  class BulutfonUser < ActiveRecord::Base
    belongs_to :user, class_name: BulutfonDashboard.user_class.to_s
    validates_presence_of :user_id, :api_token
  end
end
