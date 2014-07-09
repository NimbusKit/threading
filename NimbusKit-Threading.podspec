Pod::Spec.new do |s|
  s.name         = "NimbusKit-Threading"
  s.version      = "1.0.0
  s.license      =  { :type => 'BSD' }
  s.summary      = "Tools for working in multi-threading environments."
  s.description  = <<-DESC
                   The NimbusKit Threading library provides general-purpose tools for working in multi-threading environments.
                   DESC
  s.homepage     = "https://github.com/nimbuskit/threading"
  s.author             = { "Jeff Verkoeyen" => "jverkoey@gmail.com" }
  s.social_media_url = "http://twitter.com/featherless"
  s.requires_arc = true
  s.platform = :ios, '6.0'
  s.source       = { :git => "https://github.com/nimbuskit/threading.git", :tag => "1.0.0" }
  s.source_files  = 'src'
  s.public_header_files = 'src/NimbusKitThreading.h'
end
