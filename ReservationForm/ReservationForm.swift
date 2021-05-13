//
//  ReservationForm.swift
//  PubBar
//
//  Created by Łukasz Nycz on 06/05/2021.
//

import UIKit

protocol ReservationFormDelegate:AnyObject {

    func didTapButton(label: String, color: UIColor, sender: Any)
}
class ReservationForm: UIViewController {
    
    var reservationFormDelegate:ReservationFormDelegate!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func reserveButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        reservationFormDelegate.didTapButton(label:  "Reserved", color: .red, sender: AnyObject.self)
    }
    @IBAction func backToRestaurantButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
