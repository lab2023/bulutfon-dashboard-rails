module BulutfonDashboard
  module CdrsHelper
    def direction_icon(direction, size = 36)
      direction = direction.to_s.downcase
      capture_haml do
        haml_tag :span, class: "size-#{size}" do
          haml_tag :i, class: "icon-#{direction}-dark", toggle: 'tooltip', title: t("activerecord.attributes.cdr.direction_detail.#{direction}")
          t("activerecord.attributes.cdr.direction_detail.#{direction}")
        end
      end
    end

    def call_type_icon(call_type, size = 36)
      call_type = call_type.to_s.downcase
      if call_type == 'voice'
        icon_class = 'phone'
      else
        icon_class = 'fax'
      end
      capture_haml do
        haml_tag :span, class: "size-#{size}" do
          haml_tag :i, class: "fa fa-#{icon_class}", toggle: 'tooltip', title: t("activerecord.attributes.cdr.call_type_detail.#{call_type}")
          t("activerecord.attributes.cdr.call_type_detail.#{call_type}")
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

    def pagination(count, current)
      query = sanitize_cdr_params
      page = count

      capture_haml do
        haml_tag :nav do
          haml_tag :ul, class: :pagination do
            previous_page(current, query) if current != 1

            page_groups = get_paging_groups(page, current)
            pages(page_groups[0], current, query)
            disabled if page_groups[0].present?
            pages(page_groups[1], current, query)
            disabled if page_groups[2].present?
            pages(page_groups[2], current, query)
            next_page(current, query) if current != page
          end
        end
      end
    end

    private

    def pages(arr, current, query)
      (arr).to_a.each do |pg|
        query[:page] = pg
        haml_tag :li, class: (pg == current ? 'active' : '') do
          haml_tag :a, pg, href: "?#{query.to_query}"
        end
      end
    end

    def disabled
      haml_tag :li, class: :disabled do
        haml_tag :a, '...', href: '#'
      end
    end

    def previous_page(current, query)
      query[:page] = current - 1
      haml_tag :li do
        haml_tag :a, aria: {label: :Previous}, href: "?#{query.to_query}" do
          haml_tag :span, '← Önceki', aria: {hidden: :true}
        end
      end
    end

    def next_page(current, query)
      query[:page] = current + 1
      haml_tag :li do
        haml_tag :a, aria: {label: :Next}, href: "?#{query.to_query}" do
          haml_tag :span, 'Sonraki →', aria: {hidden: :true}
        end
      end
    end

    def get_paging_groups(page, current)
      total_pages = page
      after_first_page = 3
      arround_current_page = 5
      current_page = current
      middle_section = ([current_page - arround_current_page, 1].max..[current_page + arround_current_page, total_pages].min).to_a
      first_page_section = (1..[after_first_page, total_pages].min).to_a
      last_page_section = ([1, total_pages - after_first_page + 1].max..total_pages).to_a
      if (total_pages / 2) > current_page
        merge_left(middle_section, first_page_section)
        merge_right(middle_section, last_page_section)
      else
        merge_right(middle_section, last_page_section)
        merge_left(middle_section, first_page_section)
      end
      [first_page_section, middle_section, last_page_section]
    end

    def merge_left(middle_section, first_page_section)
      if (not middle_section.empty?) and middle_section.first - 1 <= first_page_section.last
        middle_section = first_page_section | middle_section
        first_page_section.clear
        [middle_section, first_page_section]
      end
    end

    def merge_right(middle_section, last_page_section)
      if (not middle_section.empty?) and middle_section.last + 1 >= last_page_section.first
        middle_section = middle_section | last_page_section
        last_page_section.clear
        [middle_section, last_page_section]
      end
    end

    def sanitize_cdr_params
      par = {page: params[:page]}
      par.delete(:page) unless params[:page].present?
      par
    end
  end
end
