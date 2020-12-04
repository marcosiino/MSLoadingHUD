#
# Be sure to run `pod lib lint MSLoadingHUD.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'MSLoadingHUD'
  s.version          = '0.1.0'
  s.summary          = 'A simple and easy to use loading HUD'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
A simple swift for your iOS view controllers to easily show a loading HUD with or without a loading message.
                       DESC

  s.homepage         = 'https://github.com/marcosiino/MSLoadingHUD'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Marco Siino' => 'siino.marco@gmail.com' }
  s.source           = { :git => 'https://github.com/marcosiino/MSLoadingHUD.git', :tag => s.version.to_s }

  s.ios.deployment_target = '10.0'
  s.swift_version = '5.2'
  s.source_files = 'MSLoadingHUD/Classes/**/*'
  
  s.frameworks = 'UIKit'
end
