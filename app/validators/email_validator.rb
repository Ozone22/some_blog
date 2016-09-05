class EmailValidator < ActiveModel::EachValidator

  def validate_each(record, attribute, value)
    unless value =~ /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
      record.errors[attribute] << (options[:message] || I18n.t('activerecord.errors.user.attributes.email.wrong_email'))
    end
  end

end