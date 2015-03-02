#
# Be sure to run `pod lib lint DTFormMenuController.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "DTFormMenuController"
  s.version          = "0.1.5"
  s.summary          = "Utility for creating functional forms in iOS"
  s.description      = <<-DESC
# DTForm Menu Controller

Utility for creating functional forms in iOS.
                       DESC
  s.homepage         = "https://github.com/DTHENG/DTFormMenuController"
  s.license          = 'MIT'
  s.author           = { "DTHENG" => "fender5289@gmail.com" }
  s.source           = { :git => "https://github.com/DTHENG/DTFormMenuController.git", :tag => s.version.to_s }

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = '*.{h,m}'
  s.resource_bundles = {
    'DTFormMenuController' => ['Pod/Assets/*.png']
  }

  s.public_header_files = 'Classes/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
