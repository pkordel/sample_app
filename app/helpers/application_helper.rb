module ApplicationHelper
  def full_title(title = "")
    [title, "Ruby on Rails Tutorial Sample App"].reject(&:blank?).join(" | ")
  end
end
