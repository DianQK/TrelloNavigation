Pod::Spec.new do |s|
s.name = "TrelloNavigation"
s.version = "0.9.0"
s.summary = 'Trello Navgation'
s.homepage = "https://github.com/DianQK/TrelloNavigation"
s.license = 'MIT'
s.author = {'DianQK' => 'DianQK'}
s.source = { :git => 'https://github.com/DianQK/TrelloNavigation', :tag => s.version.to_s }
s.platform = :ios, '8.0'
s.source_files = 'TrelloNavigation/*.swift'
s.framework = 'UIKit'
end