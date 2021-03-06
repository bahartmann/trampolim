module EventsHelper
  def filter_button label, name, url, current_selected_button
    selected_class = (current_selected_button == name) ? 'active' : ''
    link_to label, url, class: "btn btn-default #{selected_class}"
  end

  def event_class event_category
    event_category + '-event'
  end
end