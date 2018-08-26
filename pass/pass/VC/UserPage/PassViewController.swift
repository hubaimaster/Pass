//
//  PassViewController.swift
//  pass
//
//  Created by Chang Hwan Kim on 2018. 8. 25..
//  Copyright © 2018년 SogangRelease2018. All rights reserved.
//


import Foundation
import UIKit
import MapKit
import CoreLocation
import JDStatusBarNotification

class PassViewController: UIViewController {
    
    var market: Market!
    class func getInstance(market: Market)->PassViewController{
        let vc = UIStoryboard(name: Config.sb.Main, bundle: nil).instantiateViewController(withIdentifier: Config.vc.PassViewController) as! PassViewController
        vc.market = market
        return vc
    }
    
    @IBOutlet weak var confirmButtonBottom: NSLayoutConstraint!
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var moneyField: UITextField!
 
    override func viewDidLoad() {
        super.viewDidLoad()
        nameField.borderStyle = .none
        moneyField.borderStyle = .none
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        prepare()
        nameField.becomeFirstResponder()
    }
    
    @IBAction func confirm(_ sender: Any) {
        API.model.user.me { (me) in
            if let myId = me?.id, let marketId = self.market.id, let money = self.moneyField.text, let _money = Int(money), let tableName = self.nameField.text{
                API.model.pass.create(userId: myId, marketId: marketId, money: _money, tableName: tableName, callback: { (pass) in
                    if let pass = pass{
                        let vc = WatingViewController.getInstance(pass: pass)
                        if(pass.status == 0)
                        {
                        self.present(vc, animated: true, completion: nil)
                        }else
                        {
                             JDStatusBarNotification.show(withStatus: "지불 실패! 금액 부족!", dismissAfter: 5) 
                        }
                    }else{
                        JDStatusBarNotification.show(withStatus: "지불 실패!", dismissAfter: 5)
                    }
                })
            }
        }
    }
    
    func prepare(){
        prepareKeyboard()
    }
    
    func prepareKeyboard(){
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: Notification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: Notification.Name.UIKeyboardWillHide, object: nil)
    }
    
    @objc func keyboardWillShow(notification: Notification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            print("notification: Keyboard will show")
            UIView.animate(withDuration: 0.5) {
                if #available(iOS 11.0, *) {
                    let keyboardHeight = keyboardSize.height - self.view.safeAreaInsets.bottom
                    self.confirmButtonBottom.constant = keyboardHeight
                } else {
                    let keyboardHeight = keyboardSize.height
                    self.confirmButtonBottom.constant = keyboardHeight
                }
                self.view.layoutIfNeeded()
            }
        }
    }
    
    @objc func keyboardWillHide(notification: Notification) {
        UIView.animate(withDuration: 0.5) {
            self.confirmButtonBottom.constant = 0
        }
    }
    
}
