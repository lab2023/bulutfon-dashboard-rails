module BulutfonDashboard
  module CdrsHelper
    def direction_icon(direction, size = 36)
      direction = direction.to_s.downcase
      capture_haml do
        haml_tag :span, class: "size-#{size}" do
          haml_tag :i, class: "icon-#{direction}-dark", toggle: 'tooltip', title: t("enumerize.cdr.bf_direction.#{direction}")
          t("enumerize.cdr.bf_direction.#{direction}")
        end
      end
    end

    def sanitize_price(price, unit = nil)
      amount = sprintf('%.2f', price)
      if unit.present?
        "#{amount} #{unit}"
      else
        amount
      end
    end

    def method_missing(method, *args, &block)
      if method.to_s.include?('_path') || method.to_s.include?('_url')
        begin
          main_app.send(method, *args, &block)
        rescue NoMethodError
          super
        end
      else
        super
      end
    end
  end
end
