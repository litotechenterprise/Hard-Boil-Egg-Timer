//
//  ViewController.swift
//  EggTimer
//
//  Created by Pablo Endara on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var titleLable: UILabel!
    
    
    let eggTimes = ["Soft":300, "Medium":420, "Hard":720]
    var timer = Timer()
    var totalTime = 0
    var timePassed = 0

    
    @IBAction func HardnessSelected(_ sender: UIButton) {
        
        timer.invalidate()
        let hardness = sender.currentTitle!
        totalTime = eggTimes[hardness]!
        progressBar.progress = 0.0
        timePassed = 0
        titleLable.text = hardness
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true )
    }
    
    @objc func updateTimer() {
        if timePassed < totalTime {
            
            timePassed += 1
            progressBar.progress = Float(timePassed) / Float(totalTime)
           
        } else {
            timer.invalidate()
            titleLable.text = "Eggs are Done"
        }
    }

}
