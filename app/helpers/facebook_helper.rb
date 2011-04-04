module FacebookHelper
=begin
  Open Graph protocal header
    <meta property="og:title" content="The Rock"/>
    <meta property="og:type" content="movie"/>
    <meta property="og:url" content="http://www.imdb.com/title/tt0117500/"/>
    <meta property="og:image" content="http://ia.media-imdb.com/rock.jpg"/>
    <meta property="og:site_name" content="IMDb"/>
    <meta property="fb:admins" content="USER_ID"/>
    <meta property="og:description"
          content="A group of U.S. Marines, under command of
                   a renegade general, take over Alcatraz and
                   threaten San Francisco Bay with biological
                   weapons."/>
=end
  def open_graph_meta(options = {})
    content_for(:head) {
      options.each do |k,v|
        key = k.to_s.include?(':') ? k : "og:#{k}"
        haml_tag :meta, :property => key, :content => v
      end
    }
  end

  def like_button_for_this_page
    raw %!<fb:like href="#{request.url}" show_faces="true" width="450" font=""></fb:like>!
  end
end
