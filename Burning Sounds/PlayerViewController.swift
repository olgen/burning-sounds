//
//  ViewController.swift
//  BurningSounds
//
//  Created by Eugen on 19/09/15.
//  Copyright © 2015 olgen. All rights reserved.
//

import UIKit
import AVFoundation

class PlayerViewController: UIViewController {

    let SCClientID = "0f9c3c8990789d2db518fc672580321c"
    let SCCLientSecret = "477d2b77a2f1166ae6bf4aecc9ee7729"


    let streams = ["https://api.soundcloud.com/tracks/224359135/stream"]

    var player: AVPlayer!
    var audioPlayer: AVAudioPlayer!
    var playing = false

    @IBOutlet var timeLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        initAudioSession()
        playStreamAsset()
    }

    func initAudioSession(){
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
        } catch {
            print("Could not set audiosession category")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func playStreamAsset(){
        let asset = AVURLAsset(URL: streamUrl())

        let playingItem = AVPlayerItem(asset: asset)
        self.player = AVPlayer(playerItem: playingItem)
        self.player!.volume = 1.0
        self.player!.muted = false
        startTimer()
    }

    func streamUrl() -> NSURL {
        let stream = streams.first
        let streamWithClientId = "\(stream!)?client_id=\(SCClientID)"
        print("Using stream: \(streamWithClientId)", terminator: "\n")
        let url = NSURL(string: streamWithClientId)
        return url!
    }

    func startTimer(){
        let selector: Selector = "updateTime"
        NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: selector, userInfo: nil, repeats: true)

    }

    func updateTime(){
        let time = self.player!.currentTime().seconds
        print("time: \(time), status=\(self.player!.status.rawValue) \n")
        let player = self.player!

        switch player.status {
        case AVPlayerStatus.ReadyToPlay:
            if !playing {
                print("starting playing at time: \(time)")
                player.play()
                playing = true
            }
        case AVPlayerStatus.Failed:
            player.pause()
            print("something went wrong: \(player.error)")
        default:
            break
        }
        
        timeLabel.text = "\(time) s"
    }
    
}
