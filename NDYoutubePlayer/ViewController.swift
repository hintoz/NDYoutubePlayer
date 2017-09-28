//
//  ViewController.swift
//  NDYoutubePlayer
//
//  Created by user on 9/28/17.
//  Copyright © 2017 Den. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var videoLayerView: UIView!
    @IBOutlet weak var indentifierTextField: UITextField!
    var youtubeVideoPlayer: NDYoutubePlayer!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpYotubeVideoPlayer()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setUpYotubeVideoPlayer() {
        youtubeVideoPlayer = NDYoutubePlayer()
        youtubeVideoPlayer.frame = CGRect(x: 0, y: 0, width: self.videoLayerView.bounds.width, height: self.videoLayerView.bounds.height)
        self.videoLayerView.layer.addSublayer(youtubeVideoPlayer)
    }
    func playVideo(indentifier: String) {
        youtubeVideoPlayer.playVideo(indentifier: indentifier)
    }
    
    @IBAction func playButtonPressed(sender: UIButton) {
        if indentifierTextField.text!.isEmpty {
            return
        }
        self.playVideo(indentifier: indentifierTextField.text!)
    }



}

