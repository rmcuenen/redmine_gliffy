require 'i18n'
require 'base64'
require 'gliffy_proxy'

class GliffyDiagram
  def initialize(*args)
    raise I18n.t('error.no_diagram') unless args[0]
    @diagram_id = args[0]
  end

  def show
    document = GliffyProxy.gliffy_handle.document_get_metadata(@diagram_id)
    png_image = GliffyProxy.gliffy_handle.document_get(@diagram_id, :png)

    "<img alt='#{document.name}' title='#{document.name}' src='data:image/png;base64,#{Base64.encode64(png_image)}' />".html_safe
  end
end
