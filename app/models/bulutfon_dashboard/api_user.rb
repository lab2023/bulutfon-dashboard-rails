module BulutfonDashboard
  class ApiUser
    include ActiveModel::Validations
    include ActiveModel::Conversion
    extend ActiveModel::Naming

    cattr_accessor :user, :pbx, :credit

    def initialize(attributes = {})
      attributes.each do |name, value|
        send("#{name}=", value)
      end
    end

    def persisted?
      false
    end
  end
end
