//
//  ViewController.swift
//  WowSound
//
//  Created by Alex Hernandez on 4/14/24.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer!

    let colors: [UIColor] = [
        .systemPink,
        .systemBlue,
        .systemGreen,
        .systemYellow,
        .systemPurple,
        .systemOrange
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemPink
    }
    
    @IBAction func wowButton(_ sender: Any) {
        view.backgroundColor = colors.randomElement()
        makeWowNoise()
    }
    
    
    
    func makeWowNoise() {
        let url = Bundle.main.url(forResource:
            "wow_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf:
            url!)
        player!.play()
    }

    func getRandomPhoto() {
        
    }
}

