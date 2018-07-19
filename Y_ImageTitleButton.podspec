#
#  Be sure to run `pod spec lint Y_ImageTitleButton.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|
	#名称
  s.name         = "Y_ImageTitleButton"
  #版本
  s.version      = "0.0.1"
  #简介
  s.summary      = "创建带有图片和标题的按钮"
  #详介
  s.description  = <<-DESC
                   创建一个带有图片和标题的按钮
                   DESC

  #首页
  s.homepage     = "https://github.com/1ilI/Y_ImageTitleButton"
  #截图
  # s.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"

  #开源协议
  s.license      = { :type => "MIT", :file => "LICENSE" }
  #作者信息
  s.author             = { "1ilI" => "1ilI" }
  #iOS的开发版本
  s.ios.deployment_target = "9.0"
  #源码地址
  s.source       = { :git => "https://github.com/1ilI/Y_ImageTitleButton.git", :tag => "#{s.version}" }
  #源文件所在文件夹，会匹配到该文件夹下所有的 .h、.m文件
  s.source_files  = "Y_ImageTitleButton", "Y_ImageTitleButton/**/*.{h,m}"
  #依赖的framework
  s.framework  = "UIKit"

end
