//
//  ViewController.swift
//  BullEye
//
//  Created by Anastasia on 10/10/18.
//  Copyright © 2018 Anastasia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var currentValue: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func showAlert(){
       
        let messege = "yor value is: \(currentValue)"
        let alert = UIAlertController(title: "hi", message: messege, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    @IBAction func SliderMoved( slider: UISlider){
        print ("yor value is: \(slider.value)")
        let RoundedValue = slider.value.rounded()
        print ("The rounded your value is: \(RoundedValue)")
        currentValue = Int (RoundedValue)
    }
    


}

