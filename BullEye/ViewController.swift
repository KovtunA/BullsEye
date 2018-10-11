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
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLable: UILabel!
    @IBOutlet weak var scoreLab: UILabel!
    
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
        
        let messege = "yor value is: \(currentValue)" +
            "\nThe target value is: \(targetValue)" +
        "\nThe difference is: \(difference)"
        + "\nYour scored \(points) points"
        let alert = UIAlertController(title: "hi", message: messege, preferredStyle: .alert)
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
        targetValue = Int.random(in: 1 ... 100)
        currentValue = 50
        slider.value = Float(currentValue)
        upadateLabel()
    }
    
     func upadateLabel() {
    targetLable.text = String(targetValue)
    scoreLab.text = String(score)
    }
    
}

