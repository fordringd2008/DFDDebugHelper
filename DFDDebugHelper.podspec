Pod::Spec.new do |s|
  s.name         = "DFDDebugHelper"
  s.version      = '0.0.1'
  s.summary      = "Helper for ios."

  s.homepage     = "https://github.com/dingfude2008/DFDDebugHelper"
  s.license      = "MIT"

  s.author       = { "dingfude2008" => "dingfude@qq.com" }
  s.source       = { :git => "https://github.com/dingfude2008/DFDDebugHelper.git", :tag => s.version.to_s }
  s.source_files = "DFDDebugHelper"
  s.platform     = :ios, '7.0'
  s.framework    = 'Foundation'
end