Pod::Spec.new do |s|

  s.name             = "NDYoutubePlayer"
  s.version          = "0.1.4"
  s.summary          = "NDYoutubePlayer is subclass of AVPlayerLayer. NDYoutubePlayer help you play video from Youtube in your application."
  
  s.homepage         = "https://github.com/dhnghia22/NDYoutubePlayer"
  s.license          = 'MIT'
  s.author           = { "Nghia Dinh" => "dhnghia22@gmail.com" }
  s.source           = { :git => "https://github.com/dhnghia22/NDYoutubePlayer.git", :tag => s.version.to_s }

  s.platform     = :ios
  s.ios.deployment_target = '9.0'
  s.source_files = 'NDYoutubePlayer/NDYoutubePlayer/*.swift'

end