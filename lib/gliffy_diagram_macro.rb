require 'redmine'
require 'i18n'
require 'base64'
require 'gliffy_proxy'

Redmine::WikiFormatting::Macros.register do
  desc "Show Gliffy Diagram macro"
  macro :gliffy do |obj, args|
    return nil unless obj
    raise I18n.t('error.no_diagram') unless args[0]
    diagram_id = args[0]
    wiki_page = WikiPage.find(obj.page.id)
    return_url = url_for(:controller => 'wiki', :action => 'show', :project_id => wiki_page.wiki.project, :id => wiki_page.title)
    
    document = GliffyProxy.gliffy_handle.document_get_metadata(diagram_id)
    png_image = GliffyProxy.gliffy_handle.document_get(diagram_id, :png)
    edit_url = GliffyProxy.gliffy_handle.document_edit_link(diagram_id, return_url, sprintf(I18n.t('diagram.gliffy_return_text'), wiki_page.pretty_title))

    out = ''
    out << "<a href='#{edit_url}' class='gliffy_diagram' title='#{document.name}'>"
    out << "<img alt='#{document.name}' src='data:image/png;base64,#{Base64.encode64(png_image)}'/></a>"

    return out.html_safe
  end
end
