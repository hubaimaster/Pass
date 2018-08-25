//
//  ChargeInfoViewController.swift
//  pass
//
//  Created by Se Jin Lee on 25/08/2018.
//  Copyright © 2018 SogangRelease2018. All rights reserved.
//

import Foundation
import UIKit
import MapKit
import CoreLocation
import JDStatusBarNotification

class ChargeInfoViewController: UIViewController {
  
    @IBOutlet weak var currentMoneyTextField: UILabel!
    @IBOutlet weak var bankField: UITextField!
    @IBOutlet weak var moneyField: UITextField!
    var totalAmount : Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        currentMoneyTextField.text = ""
        API.model.user.me { (user) in
            if let totalMoney = user?.money
            {
                self.totalAmount = totalMoney
                
            }
            self.currentMoneyTextField.text = " \(self.totalAmount)원"
        };
        
        bankField.borderStyle = .none
        moneyField.borderStyle = .none
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
      
    }
    
    @IBAction func Charge(_ sender: Any) {
        guard let BankNumber = bankField.text let Money = moneyField else {
            JDStatusBarNotification.show(withStatus: "모든 정보를 입력해주세요", dismissAfter: 3)
            return
        }
    }
}
