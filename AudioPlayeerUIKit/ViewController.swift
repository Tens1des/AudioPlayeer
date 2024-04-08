//
//  ViewController.swift
//  AudioPlayeerUIKit
//
//  Created by Роман  on 08.04.2024.
//

import UIKit
import AVFoundation
class ViewController: UIViewController {
   //MARK: -Outlet
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var sliderDuration: UISlider!
    @IBOutlet weak var sliderSound: UISlider!
    //MARK: - Konstant
    var player = AVAudioPlayer()
    private var shouldPlay:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        do {
            if let audioPath = Bundle.main.path(forResource: "ROCKET - CSO", ofType: "mp3") {
                try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath))
                self.sliderDuration.maximumValue = Float(player.duration)
            }
        } catch {
            print("Error")
        }
    }

    
    //MARK: - Action
    @IBAction func buttonDidToch(_ sender: Any) {
        shouldPlay = !shouldPlay
        if shouldPlay {
            play()
        }else {
            pause()
        }
        
        func play() {
            let pauseImage = UIImage(systemName: "pause.fill")
            playButton.setImage(pauseImage, for: .normal)
            self.player.stop()
        }
        
        func pause () {
            let playImage = UIImage(systemName: "play.fill")
            playButton.setImage(playImage, for: .normal)
            self.player.play()
        }
    }
    
    @IBAction func changeSlider(_ sender: UISlider) {
        if sender == sliderDuration{
            self.player.currentTime = TimeInterval(sender.value)
        }
    }
    
    @IBAction func sliderSoundAction(_ sender: Any) {
        self.player.volume = self.sliderSound.value
    }
    
    
}

