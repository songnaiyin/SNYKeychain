Pod::Spec.new do |s|

s.name         = "SNYKeyChain"
s.version      = "1.0.0"
s.summary      = "simple KeyChain"
s.homepage     = "https://github.com/songnaiyin/SNYKeyChain"
s.license      = { :type => "MIT", :file => "LICENSE" }
s.author       = { "songnaiyin" => "598922307@qq.com" }
s.platform     = :ios, "7.0"
s.ios.deployment_target = "7.0"
s.source       = { :git => "https://github.com/songnaiyin/SNYKeyChain.git", :tag => "#{s.version}" }
s.source_files  = "SNYKeyChain/SNYKeyChain/*.{h,m,mm,cpp,c}"
s.public_header_files = ['SNYKeyChain/SNYKeyChain/*.h']
s.frameworks = "Security","UIKit"
s.requires_arc = true
end
