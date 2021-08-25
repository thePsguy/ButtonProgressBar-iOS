#
# Be sure to run `pod lib lint ButtonProgressBar-iOS.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ButtonProgressBar-iOS'
  s.version          = '1.0.1'
  s.summary          = 'A simple progress bar UIButton subclass.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Custom UIButton class with loading animation for determinate and indeterminate processes like network download / upload.
Set progress animated, or unanimated. Uses CABasicAnimation and layer stroke to display progress.
Text enlarge on tap. Animated completion image.
                       DESC

  s.homepage         = 'https://github.com/thePsguy/ButtonProgressBar-iOS'
  s.screenshots     = 'https://raw.githubusercontent.com/thePsguy/ButtonProgressBar-iOS/master/output_F2Ryon.gif', 'https://raw.githubusercontent.com/thePsguy/ButtonProgressBar-iOS/master/preview.gif'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Pushkar Sharma' => 'thePsguy@icloud.com' }
  s.source           = { :git => 'https://github.com/thePsguy/ButtonProgressBar-iOS.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/thePsguy'

  s.ios.deployment_target = '9.0'
  s.swift_versions = ['5.2', '5.4']
  s.source_files = 'Source/*.swift'
end
