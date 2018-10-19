//
//  AboutViewController.swift
//  BullEye
//
//  Created by Anastasia on 10/12/18.
//  Copyright © 2018 Anastasia. All rights reserved.
//

import UIKit
import WebKit

class AboutViewController: UIViewController {
    
    var parentVC: UIViewController?
    
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let htmlPath = Bundle.main.path(forResource: "BullsEye", ofType: "html") {
            let url = URL(fileURLWithPath: htmlPath)
            let request = URLRequest(url: url)
            webView.load(request)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let aboutVC = segue.destination as? AboutMeViewController {
            aboutVC.parentVCAbout = self
        }
    }
    
    @IBAction func close () {
        dismiss(animated: true, completion: nil)
    }
    
}
