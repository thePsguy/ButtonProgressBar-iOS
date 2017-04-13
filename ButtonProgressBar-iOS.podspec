#
# Be sure to run `pod lib lint ButtonProgressBar-iOS.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ButtonProgressBar-iOS'
  s.version          = '0.1.1'
  s.summary          = 'A simple progress bar UIButton subclass.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Custom UIButton class with loading animation for determinate and indeterminate processes.
Set progress animated, or unanimated. Uses CABasicAnimation and layer stroke to display progress.
Text enlarge on tap.
                       DESC

  s.homepage         = 'https://github.com/thePsguy/ButtonProgressBar-iOS'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Pushkar Sharma' => 'thePsguy@icloud.com' }
  s.source           = { :git => 'https://github.com/thePsguy/ButtonProgressBar-iOS.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/thePsguy'

  s.ios.deployment_target = '7.0'

  s.source_files = 'ButtonProgressBar-iOS/Classes/**/*'
end
