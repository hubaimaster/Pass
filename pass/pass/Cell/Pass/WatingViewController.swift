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
    class func getInstance(pass: Pass)->WatingViewController{
        let vc = UIStoryboard(name: Config.sb.Main, bundle: nil).instantiateViewController(withIdentifier: Config.vc.WatingViewController) as! WatingViewController
        vc.pass = pass
        return vc
    }
    
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
            Timer.scheduledTimer(withTimeInterval: 2.0, repeats: true) { (timer) in
            self.check(timer: timer)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if let tableName = pass.tableName, let money = pass.money{
            infoLabel.text = "테이블 \(tableName)\n" + "\(money) 원"
        }
        
    }
    
    func check(timer: Timer){
        if let passId = pass.id{
            API.model.pass.get(passId: passId) { (pass) in
                if let status = pass?.status{
                    if status == 0{
                        
                    }else{
                        timer.invalidate()
                        self.setPass()
                    }
                }
            }
        }
    }
    
    func setPass(){
        UIView.animate(withDuration: 0.7) {
            self.view.backgroundColor = Config.color.primaryTint
            self.statusLabel.text = "Pass"
        }
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .seconds(7)) {
            self.dismiss(animated: true, completion: {
                
            })
        }
    }
    
}
