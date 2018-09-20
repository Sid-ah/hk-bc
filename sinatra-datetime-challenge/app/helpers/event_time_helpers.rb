module EventTimeHelpers
  def date_and_time(datetime)
    datetime.strftime("%A %B %e, %Y at %l:%M %P")
  end
end

helpers EventTimeHelpers
