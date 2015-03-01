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
  s.version          = "0.1.0"
  s.summary          = "A short description of DTFormMenuController."
  s.description      = <<-DESC
                       An optional longer description of DTFormMenuController

                       * Markdown format.
                       * Don't worry about the indent, we strip it!
                       DESC
  s.homepage         = "https://github.com/DTHENG/DTFormMenuController"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "DTHENG" => "fender5289@gmail.com" }
  s.source           = { :git => "https://github.com/DTHENG/DTFormMenuController.git", :tag => s.version.to_s }

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = '../Classes/*.{h,m}'
  s.resource_bundles = {
    'DTFormMenuController' => ['Pod/Assets/*.png']
  }

  s.public_header_files = '../Classes/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
