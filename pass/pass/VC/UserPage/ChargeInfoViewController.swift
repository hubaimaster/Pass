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
        
        bankField.borderStyle = .none
        moneyField.borderStyle = .none
       
        updateCurrentMoney()
        
    }
    func updateCurrentMoney()
    {
        
        API.model.user.me { (user) in
            if let totalMoney = user?.money
            {
                self.totalAmount = totalMoney
                
            }
            self.currentMoneyTextField.text = " \(self.totalAmount)원"
        };
        
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
      
    }
    
    @IBAction func Charge(_ sender: Any) {
       
        guard let BankNumber = bankField.text, let Money = moneyField.text else {
            JDStatusBarNotification.show(withStatus: "모든 정보를 입력해주세요", dismissAfter: 3)
            return
        }
        let amountOfMoney: Int! = Int(moneyField.text!)
        
        API.model.user.me { (me) in
            let myId = me?.id
            API.model.user.charge(email: myId!, amount: amountOfMoney)
            self.tryAutoLogin()
            self.updateCurrentMoney()
            
        };
        performSegue(withIdentifier: "chargeSuccess", sender: self)
        }
    
    func tryAutoLogin(){
        print("tryAutoLogin!")
        if let email = UserDefaults.standard.string(forKey: "email"), let password = UserDefaults.standard.string(forKey: "password"){
            API.model.user.signIn(email: email, password: password) { (me) in
                if let group = me?.group{
                    
                }
            }
        }
    }
}
