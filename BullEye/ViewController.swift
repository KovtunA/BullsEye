//
//  ViewController.swift
//  BullEye
//
//  Created by Anastasia on 10/10/18.
//  Copyright © 2018 Anastasia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

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
        
    }

    @IBAction func showAlert(){
       
        let difference = abs(targetValue - currentValue)
        let points = 100 - difference
        
        score += points
        
        let title: String
        if difference == 0 {
            title = "prefect"
        } else if difference < 5 {
            title = "You almost had it"
        } else if difference < 10 {
            title = "prety good"
        } else {
            title = "try again"
        }
        
        if difference  == 0 {
            score += 100
        } else if difference == 1 {
            score += 50
        }
        
        let messege = "\nYour scored \(points) points"
        let alert = UIAlertController(title: title, message: messege, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        newRound()
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
    
}

