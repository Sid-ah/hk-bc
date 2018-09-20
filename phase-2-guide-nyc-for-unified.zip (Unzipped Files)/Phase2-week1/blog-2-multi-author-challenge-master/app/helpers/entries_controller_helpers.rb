module EntryControllerHelper
  def find_and_ensure_entry(id)
    entry = Entry.find_by(id: id)
    halt(404, erb(:'404')) if entry.nil?
    entry
  end
end

helpers EntryControllerHelper
