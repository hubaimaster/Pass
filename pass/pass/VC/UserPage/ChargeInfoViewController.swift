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

class ChargeInfoViewController: UIViewController, UITextFieldDelegate{
  
    @IBOutlet weak var chargeButton: UIButton!
    @IBOutlet weak var currentMoneyTextField: UILabel!
    @IBOutlet weak var bankField: UITextField!
    @IBOutlet weak var moneyField: UITextField!
    var totalAmount : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bankField.borderStyle = .none
        moneyField.borderStyle = .none
       
        updateCurrentMoney()
        bankField.delegate = self
        moneyField.delegate = self
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //This is for the keyboard to GO AWAYY !! when user clicks anywhere on the view
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    //This is for the keyboard to GO AWAYY !! when user clicks "Return" key  on the keyboard
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
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
            
            JDStatusBarNotification.show(withStatus: "충전 성공", dismissAfter: 3)
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
