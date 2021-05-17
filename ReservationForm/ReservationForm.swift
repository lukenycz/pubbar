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

struct UserModel {
    let userName: String
    let userSurname: String
    let userPhone: String
    let userReservation: Date
}
class ReservationForm: UIViewController {
    var reservationFormDelegate: ReservationFormDelegate!
    var model: TableModel?
    var modelUser: UserModel? {
        UserModel(userName: userNameLabel.text!,
                  userSurname: userSurnameLabel.text!,
                  userPhone: userPhoneLabel.text!,
                  userReservation: userDateReservationLabel.date)
    }
    
    @IBOutlet weak var userNameLabel: UITextField!
    @IBOutlet weak var userSurnameLabel: UITextField!
    @IBOutlet weak var userPhoneLabel: UITextField!
    @IBOutlet weak var userDateReservationLabel: UIDatePicker!
    
    
    @IBAction func reserveButton(_ sender: Any) {
        guard let model = model else { return }
        dismiss(animated: true, completion: nil)
        reservationFormDelegate.didTapButton(model: model)
       
        print(modelUser)
    }
    @IBAction func backToRestaurantButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
