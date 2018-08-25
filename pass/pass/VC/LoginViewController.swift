//
//  LoginViewController.swift
//  pass
//
//  Created by Chang Hwan Kim on 2018. 8. 25..
//  Copyright © 2018년 SogangRelease2018. All rights reserved.
//


import Foundation
import UIKit
import JDStatusBarNotification


class LoginViewController: UIViewController {
    
    var viewPassword: Bool = false
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var viewPasswordButton: UIButton!
    @IBOutlet weak var confirmButtonBottom: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        prepare()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        emailField.becomeFirstResponder()
    }
    
    @IBAction func tapBack(_ sender: Any) {
        emailField.resignFirstResponder()
        passwordField.resignFirstResponder()
    }
    
    
    @IBAction func tapViewPasswordButton(_ sender: Any) {
        viewPassword = !viewPassword
        if viewPassword{
            passwordField.isSecureTextEntry = false
            viewPasswordButton.setTitle("감추기", for: .normal)
        }else{
            passwordField.isSecureTextEntry = true
            viewPasswordButton.setTitle("보기", for: .normal)
        }
    }
    
    @IBAction func cancel(_ sender: Any) {
        self.navigationController?.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func confirm(_ sender: Any) {
        guard let email = emailField.text, let password = passwordField.text else {
            JDStatusBarNotification.show(withStatus: "이메일과 비밀번호를 입력해주세요!", dismissAfter: 3)
            return
        }
        API.model.user.signIn(email: email, password: password) { (user) in
            if user == nil{
                JDStatusBarNotification.show(withStatus: "로그인 실패", dismissAfter: 3)
            }else{
                self.save(email: email, password: password)
                JDStatusBarNotification.show(withStatus: "로그인 성공!", dismissAfter: 3)
                self.navigationController?.dismiss(animated: true, completion: nil)
            }
        }
    }
    
    func save(email: String, password: String){
        UserDefaults.standard.set(email, forKey: "email")
        UserDefaults.standard.set(password, forKey: "password")
    }
    
    func prepare(){
        prepareKeyboard()
        prepareEmailField()
        preparePasswordField()
        prepareGroupSegmentedControl()
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
            self.view.layoutIfNeeded()
        }
    }
    
    func prepareEmailField(){
        emailField.borderStyle = .none
    }
    
    func preparePasswordField(){
        passwordField.borderStyle = .none
        viewPassword = false
    }
    
    func prepareGroupSegmentedControl(){
        
    }
    
}
