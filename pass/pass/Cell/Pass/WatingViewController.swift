//
//  WatingViewController.swift
//  pass
//
//  Created by Chang Hwan Kim on 2018. 8. 25..
//  Copyright © 2018년 SogangRelease2018. All rights reserved.
//

import Foundation
import UIKit

class WatingViewController: UIViewController {
    
    var pass: Pass!
    
    @IBOutlet weak var statusLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func check(){
        if let status = pass.
    }
    
    func setPass(){
        UIView.animate(withDuration: 0.7) {
            self.view.backgroundColor = Config.color.primaryTint
            self.statusLabel.text = "Pass"
        }
    }
    
}
