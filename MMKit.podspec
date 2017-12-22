Pod::Spec.new do |s|
  s.name         = 'MMKit'
  s.summary      = 'common utils for ios.'
  s.version      = '1.0.0'
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.authors      = { 'zhangyiming' => 'ymzhangvip@gmail.com' }
  s.social_media_url = 'https://www.jianshu.com/u/6c46e1ac4ee0'
  s.homepage     = ''
  s.platform     = :ios, '8.0'
  s.ios.deployment_target = '8.0'
  s.source       = { :git => '', :tag => s.version.to_s }

  s.requires_arc = true
  s.source_files = 'MMKit/*.{h,m}'
  s.public_header_files = 'MMKit/*.{h}'

  s.frameworks = 'UIKit', 'CoreFoundation', 'QuartzCore' 

end
