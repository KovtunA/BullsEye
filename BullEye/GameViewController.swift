//
//  GameViewController.swift
//  BullEye
//
//  Created by Anastasia on 10/10/18.
//  Copyright © 2018 Anastasia. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    var currentValue = 0
    var targetValue = 0
    var score = 0
    var level = 0
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLable: UILabel!
    @IBOutlet weak var scoreLab: UILabel!
    @IBOutlet weak var levelLable: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let rounedValue = slider.value.rounded()
        currentValue = Int (rounedValue)
        newRound()
        
        let thumbImageNormal = #imageLiteral(resourceName: "SliderThumb-Normal")
        slider.setThumbImage(thumbImageNormal, for: .normal)
        
        let thumImageHiglited = #imageLiteral(resourceName: "SliderThumb-Highlighted")
        slider.setThumbImage(thumImageHiglited, for: .highlighted)
        
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        
        let trackLeftimage = #imageLiteral(resourceName: "SliderTrackLeft")
        let trackLeftResizable = trackLeftimage.resizableImage(withCapInsets: insets)
        slider.setMinimumTrackImage(trackLeftResizable, for: .normal)
        
        let trackRightimage = #imageLiteral(resourceName: "SliderTrackRight")
        let trackRightResizable = trackRightimage.resizableImage(withCapInsets: insets)
        slider.setMaximumTrackImage(trackRightResizable, for: .normal)
    }
    
    @IBAction func showAlert() {
        let (points, title) = getCurrentPointsAndAchievement()
        
        score += points
        
        let message = "\nYour scored \(points) points"
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: {
            action in
            self.newRound()
        })
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
    }
    
    func getCurrentPointsAndAchievement() -> (Int, String) {
        let difference = abs(targetValue - currentValue)
        var points = 100 - difference
        
        let title: String
        if difference == 0 {
            title = "prefect"
            points += 100
        } else if difference < 5 {
            title = "You almost had it"
            if difference == 1 {
                points += 51
            }
        } else if difference < 10 {
            title = "pretty good"
        } else {
            title = "try again"
        }
        
        return (points, title)
    }
    
    @IBAction func SliderMoved( slider: UISlider){
        let RoundedValue = slider.value.rounded()
        currentValue = Int (RoundedValue)
    }
    
    func newRound() {
        level += 1
        targetValue = Int.random(in: 1 ... 100)
        currentValue = 50
        slider.value = Float(currentValue)
        upadateLabel()
    }
    
    func upadateLabel() {
        targetLable.text = String(targetValue)
        scoreLab.text = String(score)
        levelLable.text = String(level)
    }
    
    @IBAction func startOver() {
        score = 0
        level = 0
        newRound()
    }
}
