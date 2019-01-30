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


end
