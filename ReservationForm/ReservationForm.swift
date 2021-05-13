//
//  ReservationForm.swift
//  PubBar
//
//  Created by Łukasz Nycz on 06/05/2021.
//

import UIKit

protocol ReservationFormDelegate:AnyObject {
    func didTapButton(label: String, color: UIColor)
    
}
class ReservationForm: UIViewController {
    
    var reservationFormDelegate:ReservationFormDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func reserveButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        reservationFormDelegate.didTapButton(label:  "Reserved", color: .red)
    }
    @IBAction func backToRestaurantButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
