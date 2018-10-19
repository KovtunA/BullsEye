//
//  AboutMeViewController.swift
//  BullEye
//
//  Created by Anastasia on 10/12/18.
//  Copyright © 2018 Anastasia. All rights reserved.
//

import UIKit					

class AboutMeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func close() {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func goBacktoGame() {
        if let snap = UIApplication.shared.delegate?.window??.snapshotView(afterScreenUpdates: false) { presentingViewController?.view.addSubview(snap) }
        presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
    }
}
