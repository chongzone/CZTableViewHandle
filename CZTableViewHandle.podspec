Pod::Spec.new do |s|

  s.name         = "CZTableViewHandle"
  s.requires_arc = true
  s.version      = "0.0.1"
  s.framework    = "UIKit"
  s.ios.deployment_target = "7.0"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.summary      = "A lightweight tableView that pulls its agent or data source out of the way"
  s.author       = { "chongzone" => "2209868966@qq.com" }
  s.source_files = "CZTableViewHandle/*.{h,m}"
  s.homepage     = "https://github.com/chongzone/CZTableViewHandle"
  s.source       = { :git => "https://github.com/chongzone/CZTableViewHandle.git", :tag => "0.0.1"}
                      
end