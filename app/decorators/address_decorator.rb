class AddressDecorator < Draper::Decorator
  delegate_all

  def full_street
    "#{street} #{house_number}#{' / ' unless flat_number.blank?}#{flat_number}"
  end

  def full_country_name
      country_full_name = ISO3166::Country[self.country]
      (country_full_name.translations[I18n.locale.to_s] || country_full_name.name) unless country_full_name.nil?
  end
end
