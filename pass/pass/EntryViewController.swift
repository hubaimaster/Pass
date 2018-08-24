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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
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

