require_dependency "redmine/wiki_formatting/textile/helper"

module Redmine
  module WikiFormatting
    module Textile
      module Helper

        def heads_for_wiki_formatter_with_gliffy
          heads_for_wiki_formatter_without_gliffy
          unless @heads_for_wiki_formatter_gliffy_included
            content_for :header_tags do
              out = stylesheet_link_tag("gliffy.css", :plugin => "redmine_gliffy")
              out += javascript_tag <<-javascript_tag
              jsToolBar.prototype.elements.gliffy = {
                type: 'button',
                title: '#{l(:label_tag_diagram)}',
                fn: {
                  wiki: function() { this.encloseSelection("{{gliffy(", ")}}") }
                }
              }
              javascript_tag
              out
            end
            @heads_for_wiki_formatter_gliffy_included = true
          end
        end

        alias_method_chain :heads_for_wiki_formatter, :gliffy
        
      end
    end
  end
end
