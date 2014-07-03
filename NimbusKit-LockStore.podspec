Pod::Spec.new do |s|
  s.name         = "NimbusKit-LockStore"
  s.version      = "1.0.0
  s.license      =  { :type => 'BSD' }
  s.summary      = "Key-based, read/write access to shared data across multiple threads."
  s.description  = <<-DESC
                   Lock Store provides a simple mechanism for key-based, read/write access to shared data across multiple threads.
                   DESC
  s.homepage     = "https://github.com/nimbuskit/lockstore"
  s.author             = { "Jeff Verkoeyen" => "jverkoey@gmail.com" }
  s.social_media_url = "http://twitter.com/featherless"
  s.requires_arc = true
  s.platform = :ios, '6.0'
  s.source       = { :git => "https://github.com/nimbuskit/lockstore.git", :tag => "1.0.0" }
  s.source_files  = 'src'
  s.public_header_files = 'src/NimbusKitLockStore.h'
end
