module BulutfonDashboard
  class Cdr
    include ActiveModel::Validations
    include ActiveModel::Conversion
    extend ActiveModel::Naming

    cattr_accessor :uuid, :bf_calltype, :direction, :caller, :callee, :extension, :call_price, :call_time, :answer_time, :hangup_time, :call_record, :hangup_cause, :hangup_state, :call_flow

    def initialize(attributes = {})
      attributes.each do |name, value|
        send("#{name}=", value)
      end
    end

    def persisted?
      false
    end

    def caller_id_number

    end

    def destination_number

    end

    def sip_hangup_disposition

    end
  end
end
