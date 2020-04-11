//
//  ViewController.swift
//  SwiftSenpai-Lottie-Advance-Playback
//
//  Created by Lee Kah Seng on 11/04/2020.
//  Copyright © 2020 Lee Kah Seng. All rights reserved.
//

import UIKit
import Lottie

class ViewController: UIViewController {

    var animation: Animation!
    
    @IBOutlet weak var animationView: AnimationView!
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var frameLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    var displayLink: CADisplayLink?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Create Animation object
        let jsonName = "Watermelon"
        animation = Animation.named(jsonName)
        
        // Set animation to AnimationView
        animationView.animation = animation
        animationView.contentMode = .scaleAspectFit
        
        // For display frame, progress, time
        displayLink = CADisplayLink(target: self, selector: #selector(animationCallback))
        displayLink?.add(to: .current, forMode: RunLoop.Mode.default)
    }
    
    @IBAction func playButtonTapped(_ sender: Any) {
        animationView.loopMode = .playOnce
        animationView.play()
    }
    
    @IBAction func stopButtonTapped(_ sender: Any) {
        animationView.stop()
        
        timeLabel.text = "0"
        progressLabel.text = "0"
        frameLabel.text = "0"
    }
    
    @IBAction func pauseButtonTapped(_ sender: Any) {
        animationView.pause()
    }
    
    @IBAction func jumpingWatermelonButtonTapped(_ sender: Any) {
        animationView.play(fromFrame: 190,
                           toFrame: 240,
                           loopMode: .loop)
    }
    
    @IBAction func winkingWatermelonButtonTapped(_ sender: Any) {
        animationView.play(fromProgress: 0.5,
                           toProgress: 0.75,
                           loopMode: .loop)
    }
    
    @objc func animationCallback() {
        if animationView.isAnimationPlaying {
            // Display animation frame, time and progress in realtime
            progressLabel.text = "\(animationView.realtimeAnimationProgress)"
            frameLabel.text = "\(animationView.realtimeAnimationFrame)"
            timeLabel.text = "\(animationView.realtimeAnimationFrame / CGFloat(animation.framerate) / animationView.animationSpeed)"
        }
    }
    
}

