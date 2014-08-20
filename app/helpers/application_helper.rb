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
  
  def bs_icon(name, text)
    "<span class='glyphicon glyphicon-#{name}'></span>".html_safe<<" #{text}"
  end
  
  def bs_badge(text)
    "<span class='badge'>#{text}</span>".html_safe
  end
  
  def bs_label(text, type = 'default')
    "<span class='label label-#{type}'>#{text}</span>".html_safe
  end
  
end
