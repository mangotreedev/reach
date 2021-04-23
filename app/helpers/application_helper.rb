module ApplicationHelper
  def add_background_for(filter, link)
    "gradient--blue" if filter == link
  end
end
