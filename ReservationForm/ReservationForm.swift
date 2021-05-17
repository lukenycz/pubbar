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

struct userModel {
    let userName: String
    let userSurname: String
    let userPhone: String
    let userReservation: Date
}
class ReservationForm: UIViewController {
    var reservationFormDelegate: ReservationFormDelegate!
    var model: TableModel?
    var modelUser:userModel?
    
    @IBOutlet weak var userNameLabel: UITextField!
    @IBOutlet weak var userSurnameLabel: UITextField!
    @IBOutlet weak var userPhoneLabel: UITextField!
    @IBOutlet weak var userDateReservationLabel: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    func userInfo(model: userModel) {

        userNameLabel.text = model.userName
        userSurnameLabel.text = model.userSurname
        userPhoneLabel.text = model.userPhone
        userDateReservationLabel.date = model.userReservation
        
        let userInformation = userModel(userName: model.userName, userSurname: model.userSurname, userPhone: model.userPhone, userReservation: model.userReservation)
        print(userInformation)
    }
    
    @IBAction func reserveButton(_ sender: Any) {
        guard let model = model else { return }
        dismiss(animated: true, completion: nil)
        reservationFormDelegate.didTapButton(model: model)
       
        userInfo(model: modelUser!)
    }
    @IBAction func backToRestaurantButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
