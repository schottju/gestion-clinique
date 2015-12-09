module ApplicationHelper
  def bootstrap_flash_class(flash_type)
    { success: 'alert-success',
      error:   'alert-danger',
      alert:   'alert-warning',
      notice:  'alert-info'
    }[flash_type.to_sym] || flash_type.to_s
  end

  def current_user
    UserDecorator.decorate(super) unless super.nil?
  end

#  def current_proprio
#    ProprioDecorator.decorate(super) unless super.nil?
#  end

  def active_class(link_path)
    current_page?(link_path) ? "active" : ""
  end

  def trim_float(num)
    if num.blank?
      ""
    else
      i, f = num.to_i, num.to_f
      i == f ? i : f
    end
  end

  def change_period_to_comma(number)
    trim_float(number).to_s.gsub('.', ',') unless number.nil?
  end

  def change_blank_to_dash(value)
    value.blank? ? '-' : value
  end

  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = (column == sort_column) ? "current #{sort_direction}" : nil
    direction = (column == sort_column && sort_direction == "asc") ? "desc" : "asc"
    link_to title, params.merge(sort: column, direction: direction, page: nil), { class: css_class }
  end
end
