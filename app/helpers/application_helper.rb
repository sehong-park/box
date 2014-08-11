module ApplicationHelper
  
  #Returns the full title on a per-page basis.
  def full_title(page_title)
    base_title = "아이엠박스"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end
  
  def icon(name, text)
    "<span class='glyphicon glyphicon-#{name}'></span>".html_safe<<" #{text}"
  end
end
