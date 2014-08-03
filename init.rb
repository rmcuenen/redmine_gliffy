require 'redmine'
require_dependency 'gliffy_helper_patch'

Redmine::Plugin.register :redmine_gliffy do
  name 'Redmine Gliffy plugin'
  author 'R. Cuenen'
  description 'A plugin for including Gliffy Diagrams'
  version '0.0.1'
  
  settings :default => {}, :partial => 'settings/gliffy_settings'
end

Redmine::WikiFormatting::Macros.register do
  desc "Show Gliffy Diagram macro"
  macro :gliffy do |obj, args|
    diagram = GliffyDiagram.new(*args)
    diagram.show
  end
end
