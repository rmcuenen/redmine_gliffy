require 'redmine'
require_dependency 'gliffy_helper_patch'

Redmine::Plugin.register :redmine_gliffy do
  name 'Redmine Gliffy plugin'
  author 'R. Cuenen'
  description 'A plugin for including Gliffy Diagrams'
  version '0.0.1'
  
  settings :default => {'empty' => true}, :partial => 'settings/gliffy_settings'
end
