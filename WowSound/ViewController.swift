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
    
    private let imageView: UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .white
        return imageView
    }()
    
    private let button: UIButton = {
       let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("Random Photo", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()

    let colors: [UIColor] = [
        .systemPink,
        .systemBlue,
        .systemGreen,
        .systemYellow,
        .systemPurple,
        .systemOrange
    ]
    
    var images: [UIImage] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemPink
        
        //Storing images from folder Wow_Images to image array
        for i in 1...5 {
            if let image = UIImage(named: "Wow_Images/image\(i).jpeg") {
                images.append(image)
            }
        }
        
        view.addSubview(imageView)
        imageView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        
        imageView.center = view.center
        getRandomPhoto()
        view.addSubview(button)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    @objc func didTapButton() {
        makeWowNoise()
        getRandomPhoto()
        view.backgroundColor = colors.randomElement()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        button.frame = CGRect(x: 30,
                              y: view.frame.size.height-150-view.safeAreaInsets.bottom,
                              width: view.frame.size.width-60, height: 55)
    }
    
    
    
    func makeWowNoise() {
        let url = Bundle.main.url(forResource:
            "wow_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf:
            url!)
        player!.play()
    }

    func getRandomPhoto() {
        imageView.image = images.randomElement()
    }
}

