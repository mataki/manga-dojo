module FacebookHelper
  def like_button_for_this_page
    raw %!<fb:like href="#{request.url}" show_faces="true" width="450" font=""></fb:like>!
  end
end
