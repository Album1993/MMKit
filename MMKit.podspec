Pod::Spec.new do |s|
  s.name         = 'MMKit'
  s.summary      = 'common utils for ios.'
  s.version      = '1.0.4'
  s.authors      = { 'zhangyiming' => 'ymzhangvip@gmail.com' }
  s.social_media_url = 'https://www.jianshu.com/u/6c46e1ac4ee0'
  s.homepage     = 'https://github.com/Album1993/MMKit'
  s.platform     = :ios, '8.0'
  s.ios.deployment_target = '8.0'
  s.source       = { :git => 'https://github.com/Album1993/MMKit.git', :tag => s.version.to_s }

  s.requires_arc = true
  s.public_header_files = 'MMKit/MMKit.h'
  s.source_files         = 'MMKit/MMKit.h'

  s.default_subspecs = 'DeviceKit', 'LifeKit','FileKit','DebugKit'

  s.subspec 'DeviceKit' do |ss|
    ss.source_files         = 'MMKit/DeviceKit/MM*.{h,m}', 'Classes/MM*.{h,m}'
    ss.public_header_files  = 'MMKit/DeviceKit/MM*.h'
  end

  s.subspec 'LifeKit' do |ss|
    ss.source_files         = 'MMKit/LifeKit/MM*.{h,m}'
    ss.public_header_files  = 'MMKit/LifeKit/MM*.h'
  end

  s.subspec 'FileKit' do |ss|
    ss.source_files         = 'MMKit/FileKit/MM*.{h,m}'
    ss.public_header_files  = 'MMKit/FileKit/MM*.h'
  end

  s.subspec 'DebugKit' do |ss|
    ss.source_files         = 'MMKit/DebugKit/MM*.{h,m}'
    ss.public_header_files  = 'MMKit/DebugKit/MM*.h'
  end

  s.frameworks = 'UIKit', 'CoreFoundation', 'QuartzCore','CoreTelephony','CoreLocation'

end
