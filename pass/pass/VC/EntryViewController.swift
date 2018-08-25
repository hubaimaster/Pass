//
//  ViewController.swift
//  pass
//
//  Created by Chang Hwan Kim on 2018. 8. 24..
//  Copyright © 2018년 SogangRelease2018. All rights reserved.
//

import UIKit

class EntryViewController: UIViewController {

    @IBOutlet weak var topImageView: UIImageView!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepare()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        checkLogin()
    }
    
    func showPage(group: String){
        print("showPage:" + group)
        if group == "user"{
            let vc = self.storyboard?.instantiateViewController(withIdentifier: Config.vc.UserPage)
            self.present(vc!, animated: true, completion: nil)
        }else{
            let vc = self.storyboard?.instantiateViewController(withIdentifier: Config.vc.ManagerPage)
            self.present(vc!, animated: true, completion: nil)
        }
    }
    
    func checkLogin(){
        print("checkLogin!")
        API.model.user.me { (me) in
            if let group = me?.group{
                self.showPage(group: group)
            }else{
                self.tryAutoLogin()
            }
        }
    }
    
    func tryAutoLogin(){
        print("tryAutoLogin!")
        if let email = UserDefaults.standard.string(forKey: "email"), let password = UserDefaults.standard.string(forKey: "password"){
            API.model.user.signIn(email: email, password: password) { (me) in
                if let group = me?.group{
                    self.showPage(group: group)
                }
            }
        }
    }
    
    func prepare(){
        prepareTopImageView()
        prepareStartButton()
    }
    
    func prepareTopImageView(){
        topImageView.layer.cornerRadius = 10
        topImageView.layer.masksToBounds = true
    }
    
    func prepareStartButton(){
        startButton.layer.cornerRadius = startButton.frame.height / 2
        startButton.layer.masksToBounds = true
    }


}

