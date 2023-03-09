module ApplicationHelper
  def partials_helper(current_user)
    if current_page?(new_room_path(current_user))
      render partial: 'account/rooms/form'
    elsif current_page?(users_path(current_user))
      render partial: 'account/users/users'
    else
      render 'account/rooms/rooms'
    end
  end

  def message_time(message)
    DateTime.parse(message.created_at.to_s).strftime("%H:%M")
  end

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
