//
//  AboutMeViewController.swift
//  BullEye
//
//  Created by Anastasia on 10/12/18.
//  Copyright © 2018 Anastasia. All rights reserved.
//

import UIKit					

class AboutMeViewController: UIViewController {
    
    var parentVC: UIViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func close() {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func goBacktoGame() {
        dismiss(animated: true, completion: {
            self.parentVC?.dismiss(animated: true, completion: nil)
        })
    }
}
