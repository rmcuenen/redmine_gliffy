require 'httparty'
require 'gliffy'
require 'uri'

module GliffyProxy
  class HTTProxy
    include HTTParty

    if proxy = ENV["http_proxy"] || ENV["HTTP_PROXY"]
      scheme = "http://"
      proxy = proxy.dup
      proxy.insert(0, scheme) unless proxy.index(scheme) == 0
      url = URI.parse(proxy)
      http_proxy(url.host, url.port, url.user, url.password)
    end
  end

  def self.gliffy_handle
    @gliffy ||= init_gliffy
  end

  private

    def self.init_gliffy
      credentials = Gliffy::Credentials.new(Setting.plugin_redmine_gliffy['gliffy_consumer_key'],
                                            Setting.plugin_redmine_gliffy['gliffy_consumer_secret'],
                                            "Redmine Gliffy Plugin",
                                            Setting.plugin_redmine_gliffy['gliffy_account_id'],
                                            Setting.plugin_redmine_gliffy['gliffy_username'])
      return Gliffy::Handle.new('www.gliffy.com/api/1.0', 'www.gliffy.com/gliffy', credentials, HTTProxy)
    end
end
