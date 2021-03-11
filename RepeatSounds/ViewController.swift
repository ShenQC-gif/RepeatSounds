//
//  ViewController.swift
//  RepeatSounds
//
//  Created by ちいつんしん on 2021/03/04.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    private var soundPlayer = SoundPlayer()

    @IBAction func playOneTime(_ sender: Any) {
        soundPlayer.playSound(fileName: "roulette", extentionName: "mp3", isRepeat: false)
        }

    @IBAction func repeatSound(_ sender: Any) {
        soundPlayer.playSound(fileName: "roulette", extentionName: "mp3", isRepeat: true)
    }

    @IBAction func stopSound(_ sender: Any) {
        soundPlayer.stopSound()
    }

}

class SoundPlayer {
    private var audioPlayer: AVAudioPlayer!

    func playSound(fileName: String, extentionName: String, isRepeat: Bool) {
        let soundURL = Bundle.main.url(forResource: fileName, withExtension: extentionName)

        do {
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL!)
            if isRepeat {
                audioPlayer.numberOfLoops = -1
                print("Sound is repeated")
            } else {
                audioPlayer.numberOfLoops = 0
                print("Sound is played one time")
            }
            audioPlayer?.play()
        } catch {
            print("error")
        }
    }

    func stopSound() {
        audioPlayer.stop()
        print("Sound is stopped")
    }
}

