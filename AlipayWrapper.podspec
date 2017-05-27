#
# Be sure to run `pod lib lint AlipayWrapper.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'AlipayWrapper'
  s.version          = '0.1.2'
  s.summary          = 'AlipayWrapper 是 AlipaySDK 的帮助类库。'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
AlipayWrapper 是 AlipaySDK 的帮助类库。它从 AlipaySDK 官方 Demo 中提取除 AlipaySDK.framework 和 AlipaySDK.bundle 之外的文件。
                       DESC

  s.homepage         = 'https://github.com/EvoIos/AlipayWrapper'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'zhenglanchun' => 'zlanchun@gmail.com' }
  s.source           = { :git => 'https://github.com/EvoIos/AlipayWrapper.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.platform     = :ios, "7.0"
  s.ios.deployment_target = '7.0'

  s.source_files = 'AlipayWrapper/Classes/**/*.{h,m}'
  
  s.dependency 'AlipaySDKIniOS', '~> 15.2.0'

  s.pod_target_xcconfig = {
    'FRAMEWORK_SEARCH_PATHS' => '$(inherited) $(PODS_ROOT)/AlipaySDKIniOS',
    'OTHER_LDFLAGS'          => '$(inherited) -undefined dynamic_lookup'
  }

  s.subspec 'Util' do |util|
    util.source_files = 'AlipayWrapper/Util/**/*.{h,m}'
    util.dependency 'AlipayWrapper/OpenSSL'
  end
  
  s.subspec 'OpenSSL' do |openssl|
    openssl.source_files = 'AlipayWrapper/Openssl/**/*.h'
    openssl.public_header_files = 'AlipayWrapper/Openssl/**/*.h'
    openssl.ios.preserve_paths      = 'AlipayWrapper/StaticLibrary/libcrypto.a', 'AlipayWrapper/StaticLibrary/libssl.a'
    openssl.ios.vendored_libraries  = 'AlipayWrapper/StaticLibrary/libcrypto.a', 'AlipayWrapper/StaticLibrary/libssl.a'
    openssl.libraries = 'ssl', 'crypto'
    openssl.xcconfig = { 'HEADER_SEARCH_PATHS' => "${PODS_ROOT}/#{s.name}/AlipayWrapper/Openssl/**" }
  end

end
