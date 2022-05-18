//
//  ViewController.swift
//  GoGoRace
//
//  Created by Гость on 16.05.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var pcCar: UIImageView!
    @IBOutlet weak var userCar: UIImageView!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var semaforLabel: UILabel!
    @IBOutlet weak var lineFinish: UIImageView!
    
    var stopMove: Int = 1
    var timerGame: Timer!
    var timerPC: Timer!
    
    @objc func pcDrive() {
        if stopMove == 2 {
            pcCar.center.x += 10
        }
        
        if pcCar.center.x > lineFinish.center.x {
            resultLabel.isHighlighted = false
            resultLabel.text = "ПРОИГРЫШ!"
            resultLabel.textColor = .red
            timerPC.invalidate()
            }
        }
    
    @objc func intervalTimer() {
        stopMove += 1
        
        if stopMove > 2 {
            stopMove = 1
        }
        
        switch stopMove {
        case 1:
            semaforLabel.text = "СТОЙ"
            semaforLabel.textColor = .red
        case 2:
            semaforLabel.text = "ЕЗЖАЙ"
            semaforLabel.textColor = .green
        default:
            break
        }
    }
    
    @IBAction func startGame(_ sender: UIButton) {
        semaforLabel.isHidden = false
        
        timerGame = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(intervalTimer), userInfo: nil, repeats: true)
        timerPC = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(pcDrive), userInfo: nil, repeats: true)
    }
    
    @IBAction func driveGame (_ sender: UIButton) {
        if stopMove == 2 {
            userCar.center.x += 10
        } else if stopMove == 1 {
            userCar.center.x -= 10
        }
        
        if userCar.center.x > lineFinish.center.x {
            resultLabel.isHidden = false
            resultLabel.text = "ПОБЕДА!"
            resultLabel.textColor = .green
            timerPC.invalidate()
            timerGame.invalidate()
        }
        
    }
    
}


