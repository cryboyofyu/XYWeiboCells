  Pod::Spec.new do |s|
  s.name         = "XYWeiboCells"
  s.version      = "0.0.2"
  s.summary      = "like weibo cells"

  s.description  = <<-DESC
                   like weibo cells,Custom graphic are mixed，Very convenient！
                   DESC

  s.homepage     = "https://github.com/cryboyofyu/XYWeiboCells.git"


  s.license      = "MIT"
  # s.license     = { :type => "MIT", :file => "FILE_LICENSE" }

  s.author       = { "LV" => "cryboyofyu@gmail.com" }
  s.platform    =:ios, "7.0"

  s.source       = { :git => "https://github.com/cryboyofyu/XYWeiboCells.git", :tag => "0.0.2" }

  s.source_files  = "XYWeiboExample/XYWeiboExample/XYWeiboCells/{XYModels,XYViews}/*.{h,m}"

  s.resources = 'XYWeiboExample/XYWeiboExample/XYClasses/XYTestImgs/*.png'
  s.framework  = 'UIKit'

  s.dependency 'XYJGG'
  s.dependency 'YYImage'
  s.dependency 'IDMPhotoBrowser'
  s.dependency 'YYText'

  #s.requires_arc = true


end




