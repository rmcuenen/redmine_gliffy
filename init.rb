require 'gliffy_diagram_macro'
require 'gliffy_helper_patch'
require 'gliffy_view_hook'

Redmine::Plugin.register :redmine_gliffy do
  name 'Redmine Gliffy plugin'
  author 'R. Cuenen'
  description 'A plugin for including Gliffy Diagrams'
  version '0.0.1'
  
  settings :default => {}, :partial => 'settings/gliffy_settings'
end
