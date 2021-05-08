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
    
    
//    @objc private func didTapButton(_ sender: UIButton){
//    ReservationFormDelegate?.didTapButton()
//    }

       // somewhere in the configuration and layout of button and other views
    override func viewDidLoad() {
        super.viewDidLoad()
      //  button.addTarget(self, action: #selector(reserveButton), for: .touchUpInside)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func reserveButton(_ sender: Any) {
        let button = UIButton()
        button.addTarget(self, action: #selector(reserveButton), for: .touchUpInside)
        ReservationFormDelegate?.didTapButton()
    }
    
   
    
    @IBAction func backToRestaurantButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
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
