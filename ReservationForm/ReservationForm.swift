//
//  ReservationForm.swift
//  PubBar
//
//  Created by Łukasz Nycz on 06/05/2021.
//

import UIKit

protocol ReservationFormDelegate {
    func didTapButton(model: TableModel)
}
class ReservationForm: UIViewController {
    var reservationFormDelegate: ReservationFormDelegate!
    var model: TableModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func reserveButton(_ sender: Any) {
        guard let model = model else { return }
        dismiss(animated: true, completion: nil)
        reservationFormDelegate.didTapButton(model: model)
    }
    @IBAction func backToRestaurantButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
