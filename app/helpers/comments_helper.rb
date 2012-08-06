module CommentsHelper

  def gravatar_image_tag(email, html_options = {})
    email = Digest::MD5.hexdigest(email)
    image_tag "http://www.gravatar.com/avatar/#{email}?size=48", html_options
  end
end
