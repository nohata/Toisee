module DeviseHelper
  def devise_error_messages!
    return "" if resource.errors.empty?

    html = '<div class="alert alert-warning"><a class="close" data-dismiss="alert">×</a>'
    messages = resource.errors.full_messages.each do |errmsg|
      html += <<-EOF
        #{errmsg}<br>
      EOF
    end
    html += "</div>"
    html.html_safe
  end

  def devise_error_messages?
    resource.errors.empty? ? false : true
  end

end