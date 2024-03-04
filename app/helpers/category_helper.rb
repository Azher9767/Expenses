module CategoryHelper
  def error_validation_class(errors, field)
    if errors[field].present?
      'is-invalid'
    else
      'is-valid'
    end
  end
end
