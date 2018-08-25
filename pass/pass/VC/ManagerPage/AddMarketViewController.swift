//
//  AddMarketViewController.swift
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

class AddMarketViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var confirmButtonBottom: NSLayoutConstraint!
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var descField: UITextField!
    @IBOutlet weak var backNameField: UITextField!
    @IBOutlet weak var accountNumberField: UITextField!
    
    var lat: Double!
    var lng: Double!
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameField.borderStyle = .none
        descField.borderStyle = .none
        backNameField.borderStyle = .none
        accountNumberField.borderStyle = .none
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        prepare()
    }
    
    @IBAction func confirm(_ sender: Any) {
        guard let lat = lat, let lng = lng, let name = nameField.text, let backName = backNameField.text, let desc = descField.text, let accountNumber = accountNumberField.text else {
            JDStatusBarNotification.show(withStatus: "모든 정보를 입력해주세요", dismissAfter: 3)
            return
        }
        let alert = UIAlertController(title: "현재 위치 확인", message: "위도:\(lat)\n경도:\(lng)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "지도 보기", style: .default, handler: { (_) in
            let coordinate = CLLocationCoordinate2DMake(lat, lng)
            let mapItem = MKMapItem(placemark: MKPlacemark(coordinate: coordinate, addressDictionary:nil))
            mapItem.name = "내 가게"
            mapItem.openInMaps(launchOptions: [MKLaunchOptionsDirectionsModeKey : MKLaunchOptionsDirectionsModeDriving])
        }))
        alert.addAction(UIAlertAction(title: "확인", style: UIAlertActionStyle.default, handler: { (_) in
            API.model.user.me(callback: { (me) in
                if let myId = me?.id{
                    print("try!!")
                    API.model.market.create(userId: myId, name: name, desc: desc, bankName: backName, accountNumber: accountNumber, lat: lat, lng: lng, callback: { (success) in
                        if success{
                            JDStatusBarNotification.show(withStatus: "등록 성공!", dismissAfter: 3)
                            self.dismiss(animated: true, completion: nil)
                        }else{
                            JDStatusBarNotification.show(withStatus: "등록 실패", dismissAfter: 3)
                        }
                    })
                }
            })
            
        }))
        alert.addAction(UIAlertAction(title: "취소", style: .cancel, handler: { (_) in
            
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        self.lat = locValue.latitude
        self.lng = locValue.longitude
        print("locations = \(locValue.latitude) \(locValue.longitude)")
    }
    
    func prepareLocation(){
        // Ask for Authorisation from the User.
        self.locationManager.requestAlwaysAuthorization()
        
        // For use in foreground
        self.locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
    }
    
    func prepare(){
        prepareKeyboard()
        prepareLocation()
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
