//
//  ViewController.swift
//  qweqwewqewqe
//
//  Created by Гость on 16.04.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var semaforLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var pinkCar: UIImageView!
    @IBOutlet weak var redCar: UIImageView!
    @IBOutlet weak var finishLinne: UIImageView!
    
    var stateSemafor: Int = 1
    var timerGame: Timer!
    var timerPC: Timer!
    
    @objc func pcDrive() {
        if stateSemafor == 2 {
            pinkCar.center.x += 10
            
        }
        if pinkCar.center.x > finishLinne.center.x {
            resultLabel.isHighlighted = false
            resultLabel.text = "YOU LOSE!"
            resultLabel.textColor = .red
            timerPC.invalidate()
            timerGame.invalidate()
        }
    }
    @objc func intervalTimer() {
        stateSemafor += 1
        if stateSemafor > 2 {
            stateSemafor = 1
    }
    switch stateSemafor {
    case 1:
        semaforLabel.text = "STOP"
        semaforLabel.textColor = .red
    case 2:
        semaforLabel.text = "DRIVE"
        semaforLabel.textColor = .green
    default:
        break
    }
    }
    @IBAction func startGame(_ sender: UIButton) {
        semaforLabel.isHidden = false
        
        Timer.scheduledTimer(timeInterval: 3.0, target: self, selector:#selector(intervalTimer), userInfo: nil, repeats: true)
        timerPC = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(pcDrive), userInfo: nil, repeats: true)
    }
    @IBAction func driveGame(_ sender: UIButton) {
        if stateSemafor == 2 {
            redCar.center.x += 10
        } else if stateSemafor == 1 {
            redCar.center.x -= 10
        }
        if redCar.center.x > finishLinne.center.x {
            resultLabel.isHidden = false
            resultLabel.text = "YOU WIN!"
            resultLabel.textColor = .green
            timerPC.invalidate()
            timerGame.invalidate()
        }
    }


}

