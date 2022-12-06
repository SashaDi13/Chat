module ApplicationHelper
  def avatar(room, *classes)
    if !room.avatar.blank?
      image_tag(room.avatar.url, class: "rounded-full w-14 h-14 #{classes.join(' ')}")
    elsif room.avatar.blank?
      content_tag(:div, content_tag(:span, room.username.split(' ').map {|n| n[0].upcase }.join('')), class: "empty-avatar #{classes.join(' ')}")
    else
      content_tag(:div, content_tag(:span, room.name.split(' ').map {|n| n[0].upcase }.join('')), class: "empty-avatar #{classes.join(' ')}")
    end
  end
end
