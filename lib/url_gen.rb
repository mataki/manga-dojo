#
# URLを取得できない場合(モデルなど)に利用する
#
# example)  UrlGen.groups_url
#           UrlGen.group_entry_url(group, entry)
#

class UrlGen
  include Singleton

  include Rails.application.routes.url_helpers

  def self.method_missing(name, *args)
    method_name = name.to_s

    self.instance.send(name, *args)
  end
end

UrlGen.default_url_options = { :host => APP_CONFIG[:host], :port => APP_CONFIG[:port] }
