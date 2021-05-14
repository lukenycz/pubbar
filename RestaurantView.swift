//
//  RestaurantView.swift
//  PubBar
//
//  Created by Łukasz Nycz on 05/05/2021.
//

import UIKit

var restaurantView:RestaurantView?

//var pubBarLogic:PubBarLogic?

class RestaurantView: UIViewController {
    
    var reservationFormDelegate: ReservationFormDelegate!
    
    @IBOutlet weak var tableReservation1: UIButton!
    @IBOutlet weak var tableReservation2: UIButton!
    @IBOutlet weak var firstRoomView: UIView!
    @IBOutlet weak var secondRoomView: UIView!
    
    @IBAction func tableTapped(_ sender: UIButton) {
        goToReserveForm()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //tableReservation.backgroundColor = .green

        firstRoomView.isHidden = false
        secondRoomView.isHidden = true
    }

    @IBAction func didChangeSegment(_ sender: UISegmentedControl){
        if sender.selectedSegmentIndex == 0 {
            firstRoomView.isHidden = false
            secondRoomView.isHidden = true
            
            
        } else if sender.selectedSegmentIndex == 1 {
            firstRoomView.isHidden = true
            secondRoomView.isHidden = false
        }
        
    }

    func goToReserveForm() {
        let storyboard = UIStoryboard(name: "ReservationForm", bundle: nil)
        let reservationVC = storyboard.instantiateViewController(withIdentifier: "ReservationForm") as! ReservationForm
        self.present(reservationVC, animated: true, completion: nil)
    }
}

