Pod::Spec.new do |s|
  s.name         = "TrelloNavigation"
  s.version      = "0.10.0"
  s.summary      = "Trello Navigation Swift"
  s.description  = "Trello Navigation UI Swift 4.2"
  s.homepage     = "https://github.com/DianQK/TrelloNavigation"
  s.license      = "MIT"
  s.author             = { "DianQK" => "dianqk@icloud.com" }
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/DianQK/TrelloNavigation.git", :tag => s.version }
  s.source_files  = "Source/*.swift"
  s.exclude_files = "Classes/Exclude"
  s.requires_arc = true
  s.swift_version = '4.2'
end
