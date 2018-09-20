module EventFormHelpers
  def event_form_action(event)
    event.persisted? ? "/events/#{event.id}" : "/events"
  end

  def event_date_input_format(datetime)
    return "" unless datetime

    datetime.strftime("%Y-%m-%d %I:%M %P")
  end

  def submit_button_value(event)
    event.persisted? ? "Update Event" : "Create Event"
  end
end

helpers EventFormHelpers
