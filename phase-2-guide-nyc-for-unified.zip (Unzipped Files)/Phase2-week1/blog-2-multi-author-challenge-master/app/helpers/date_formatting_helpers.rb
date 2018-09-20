module DateFormatting
  def long_form_date(timestamp)
    timestamp.strftime('%B %e, %Y')
  end
end

helpers DateFormatting
