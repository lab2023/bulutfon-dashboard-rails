module BulutfonDashboard
  class BulutfonUser < ActiveRecord::Base
    belongs_to :user, class_name: BulutfonDashboard.user_class.to_s
    validates_presence_of :user_id, :api_token
    validate :check_api_token_is_valid

    private

    def check_api_token_is_valid
      if self.api_token.present?
        begin
          bulutfon = BulutfonSDK::REST::Bulutfon.new(self.api_token)
          bulutfon.details
        rescue BulutfonSDK::REST::RequestError
          self.errors.add(:api_token)
        end
      end
    end

  end
end
