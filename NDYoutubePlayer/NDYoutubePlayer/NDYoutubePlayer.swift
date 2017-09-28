//
//  NDYoutubePlayer.swift
//  NDYoutubeKit
//
//  Created by user on 9/28/17.
//  Copyright © 2017 Den. All rights reserved.
//

import Foundation
import AVKit

open class NDYoutubePlayer: AVPlayerLayer {
    var youtubePlayer: AVPlayer!
    override init() {
        super.init()
    }
    
    func playVideo(indentifier: String, quality: NDYouTubeVideoQuality? = nil, isAutoPlay: Bool = true) {
        if youtubePlayer != nil {
            youtubePlayer.pause()
            youtubePlayer.replaceCurrentItem(with: nil)
            youtubePlayer = nil
        }
        NDYoutubeClient.shared.getVideoWithIdentifier(videoIdentifier: indentifier) { [weak self] (video, err) in
            guard let video = video else { return }
            guard let streamURLs = video.streamURLs else { return }
            if let quality = quality {
                if let videoString = streamURLs[quality.rawValue] {
                    self?.youtubePlayer = AVPlayer(url: URL(string: videoString as! String)!)
                    self?.player = self?.youtubePlayer
                    if isAutoPlay {
                        self?.youtubePlayer.play()
                    }
                }
            }
            else if let videoString = streamURLs[NDYouTubeVideoQuality.NDYouTubeVideoQualityHD720.rawValue] ?? streamURLs[NDYouTubeVideoQuality.NDYouTubeVideoQualityMedium360.rawValue] ?? streamURLs[NDYouTubeVideoQuality.NDYouTubeVideoQualitySmall240.rawValue] {
                self?.youtubePlayer = AVPlayer(url: URL(string: videoString as! String)!)
                self?.player = self?.youtubePlayer
                if isAutoPlay {
                    self?.youtubePlayer.play()
                }
            }
        }
    }    
    
    func stop() {
        if youtubePlayer != nil {
            youtubePlayer.pause()
            youtubePlayer.replaceCurrentItem(with: nil)
            youtubePlayer = nil
        }
    }
    
    func play() {
        if youtubePlayer != nil {
            youtubePlayer.play()
        }
    }
    
    func pause() {
        if youtubePlayer != nil {
            youtubePlayer.pause()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
