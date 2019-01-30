module ApplicationHelper


  def flash_class(level)
    case level
      #bootstrap class type in success, info, warning, danger
      when "notice" then "info"
      # when "success" then "success"
      when "error" then "warning"
      when "alert" then "info"
      else level
    end
  end

  def resource_name
     :user
  end

  def resource
     @resource ||= User.new
  end

  def devise_mapping
     @devise_mapping ||= Devise.mappings[:user]
  end

end
