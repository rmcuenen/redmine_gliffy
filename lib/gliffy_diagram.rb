require 'i18n'
require 'base64'
require 'gliffy'

class GliffyDiagram
  def initialize(*args)
    raise I18n.t('error.no_diagram') unless args[0]
    @diagram_id = args[0]
  end

  def show
    document = GliffyDiagram.gliffy_handle.document_get_metadata(@diagram_id)
    png_image = GliffyDiagram.gliffy_handle.document_get(@diagram_id, :png)

    "<img alt='#{document.name}' title='#{document.name}' src='data:image/png;base64,#{Base64.encode64(png_image)}' />".html_safe
  end

  def self.gliffy_handle
    @gliffy ||= Gliffy::Handle.new('www.gliffy.com/api/1.0', 'www.gliffy.com/gliffy',
                        Gliffy::Credentials.new(Setting.plugin_redmine_gliffy['gliffy_consumer_key'],
                                                Setting.plugin_redmine_gliffy['gliffy_consumer_secret'],
                                                "Redmine Gliffy Plugin",
                                                Setting.plugin_redmine_gliffy['gliffy_account_id'],
                                                Setting.plugin_redmine_gliffy['gliffy_username']))
  end
end
