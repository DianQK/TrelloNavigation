Pod::Spec.new do |s|
s.name = 'TrelloNavigation'
s.version = '0.9.2'
s.summary = 'Trello Navgation'
s.homepage = 'https://github.com/DianQK/TrelloNavigation'
s.license = 'MIT'
s.author = { 'DianQK' => 'DianQK' }
s.source = { :git => 'https://github.com/DianQK/TrelloNavigation.git', :tag => s.version }
s.platform = :ios, '8.0'
s.source_files = 'TrelloNavigation/*.swift'
s.requires_arc = true
end