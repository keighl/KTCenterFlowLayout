Pod::Spec.new do |s|
  s.name             = "KTCenterFlowLayout"
  s.version          = "1.3.1"
  s.summary          = "Aligns cells to the center of a collection view."

  s.homepage         = "https://github.com/keighl/KTCenterFlowLayout"
  s.license          = 'MIT'
  s.author           = { "keighl" => "keighl@keighl.com" }
  s.source           = { :git => "https://github.com/keighl/KTCenterFlowLayout.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/keighl'

  s.ios.deployment_target = '7.0'
  s.tvos.deployment_target = '9.0'
  s.requires_arc = true

  s.source_files = 'KTCenterFlowLayout.{h,m}'

  s.frameworks = 'UIKit'

end
