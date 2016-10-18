Pod::Spec.new do |s|

s.name         = "SNYKeychain"
s.version      = "1.1"
s.summary      = "simple Keychain"
s.homepage     = "https://github.com/songnaiyin/SNYKeychain"
s.license      = { :type => "MIT", :file => "LICENSE" }
s.author       = { "songnaiyin" => "598922307@qq.com" }
s.platform     = :ios, "7.0"
s.ios.deployment_target = "7.0"
s.source       = { :git => "https://github.com/songnaiyin/SNYKeychain.git", :tag => "#{s.version}" }
s.source_files  = "SNYKeychain/SNYKeychain/*.{h,m,mm,cpp,c}"
s.public_header_files = ['SNYKeychain/SNYKeychain/*.h']
s.frameworks = "Security","Foundation"
s.requires_arc = true
end
