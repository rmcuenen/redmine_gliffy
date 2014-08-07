module GliffyDiagramImage
  class Hooks < Redmine::Hook::ViewListener
    def view_layouts_base_html_head(context={})
      stylesheet_link_tag 'gliffy_diagram', :plugin => 'redmine_gliffy'
    end
  end
end