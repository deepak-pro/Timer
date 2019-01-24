//
//  ViewController.swift
//  Timer
//
//  Created by AGREE on 23/01/19.
//  Copyright © 2019 AGREE. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    var timer = Timer()
    var audioplay = AVAudioPlayer()

    @IBOutlet weak var input: UITextField!
    
    var time = 0
   
    @objc func decreaseTimer() {
        
        if time > 0 {
            
            time -= 1
            
            timelabel.text = String(time)
            
        } else {
            audioplay.play()
            timer.invalidate()
            
        }
        
    }
    @IBOutlet weak var timelabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        do {
            let path = Bundle.main.path(forResource: "sound", ofType: ".mp3")
            try audioplay = AVAudioPlayer(contentsOf: URL(fileURLWithPath: path!))
        }
        catch{
            
        }
    }
    @IBAction func minus(_ sender: Any) {
        if time > 5 {
            time -= 5
            timelabel.text = String(time)
        }
    }
    
    @IBAction func plus(_ sender: Any) {
        if time != 0{time += 5
            timelabel.text = String(time)}
    }
    
    @IBAction func start(_ sender: Any) {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.decreaseTimer), userInfo: nil, repeats: true)    }
    
    @IBAction func reset(_ sender: Any) {
        timelabel.text = String(time)
        timer.invalidate()
    }
    @IBAction func stop(_ sender: Any) {
        timer.invalidate()
        audioplay.stop()
    }
    
    
}

