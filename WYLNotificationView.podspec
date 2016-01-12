
Pod::Spec.new do |s|
  s.name             = "WYLNotificationView"
  s.version          = "1.0.6"
  s.summary          = "一个用来展示提醒或者创建节日图片下落的view"
  s.description      = <<-DESC
			一个用来展示提醒或者创建节日图片下落的view. 553836854@qq.com            
                       DESC
  s.homepage         = "https://github.com/wangyanlong/WYLNotificationView"
  # s.screenshots      = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "王颜龙" => "553836854@qq.com" }
  s.source           = { :git => "https://github.com/wangyanlong/WYLNotificationView.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/NAME'

  s.platform     = :ios, '7.0'
  # s.ios.deployment_target = '5.0'
  # s.osx.deployment_target = '10.7'
  s.requires_arc = true

  s.source_files = 'WYLNotificationView/WYLNotificationView/WYLNotificationView/*.{h,m}'
  # s.resources = 'Assets'

  # s.ios.exclude_files = 'Classes/osx'
  # s.osx.exclude_files = 'Classes/ios'
  # s.public_header_files = 'Classes/**/*.h'
  s.frameworks = 'Foundation', 'CoreGraphics', 'UIKit'

end
