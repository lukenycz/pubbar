//
//  ReservationForm.swift
//  PubBar
//
//  Created by Łukasz Nycz on 06/05/2021.
//

import UIKit

protocol ReservationFormDelegate:AnyObject {
    func didTapButton()
    
}

class ReservationForm: UIViewController {

    var restaurantView:RestaurantView?
    
    weak var ReservationFormDelegate:ReservationFormDelegate?
//    private let button = UIButton()
//    button.addTarget(self, action: #selector(didTapButton), for : .touchUpInside)
    
    
//    @objc private func didTapButton(_ sender: UIButton){
//    ReservationFormDelegate?.didTapButton()
    
    weak var delegate: ReservationFormDelegate?
       private let button = UIButton()

       // somewhere in the configuration and layout of button and other views
    func buttonTapped() {
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
       @objc func didTapButton(_ sender: UIButton) {
           delegate?.didTapButton()
       }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func reserveButton(_ sender: Any) {
        changeTableColor()
        buttonTapped()
    }
    
   
    
    @IBAction func backToRestaurantButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    func changeTableColor() {
        
        restaurantView?.TableFor2Outlet.backgroundColor = UIColor.purple
        restaurantView?.secondRoomView.backgroundColor = UIColor.purple
        restaurantView?.firstRoomView.backgroundColor = UIColor.blue
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
