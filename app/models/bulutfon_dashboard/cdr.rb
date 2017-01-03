module BulutfonDashboard
  class Cdr
    include ActiveModel::Validations
    include ActiveModel::Conversion
    extend ActiveModel::Naming

    cattr_accessor :uuid, :bf_calltype, :direction, :caller, :callee, :extension, :call_price, :call_time, :answer_time, :hangup_time, :call_record, :hangup_cause, :hangup_state, :call_flow, :caller_id_number, :destination_number, :sip_hangup_disposition

    def initialize(attributes = {})
      attributes.each do |name, value|
        send("#{name}=", value)
      end
    end

    def persisted?
      false
    end

    def direction_in?
      direction == 'IN'
    end

    def direction_out?
      direction == 'OUT'
    end

    def hangup_cause_i18n
      I18n.t("enumerates.hangup_cause.#{hangup_cause.upcase}")
    end

    def sip_hangup_disposition_hover_i18n
      I18n.t("enumerates.sip_hangup_disposition_hover.#{disposition_state}")
    end

    def sip_hangup_disposition_i18n
      I18n.t("enumerates.sip_hangup_disposition.#{disposition_state}")
    end

    def calculate_call_price
      call_price.present? ? call_price.to_f * 100 : 0.00
    end

    def call_record_exists?
      call_record == 'YES'
    end

    private

    def disposition_state
      hangup_state.present? ? hangup_state : 'blank'
    end

  end
end
