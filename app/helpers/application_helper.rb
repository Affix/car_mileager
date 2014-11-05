module ApplicationHelper
  def current_page(path)
    'tab-current' if current_page?(path)
  end
end
