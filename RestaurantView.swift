//
//  RestaurantView.swift
//  PubBar
//
//  Created by Łukasz Nycz on 05/05/2021.
//

import UIKit

struct TableModel {
    let id: Int
    let title: String
}

enum RoomModel {
    case first, second
    
    var tables: [TableModel] {
        switch self {
        case .first:
            return (0...10).map { TableModel(id: $0, title: "First\($0)") }
        case .second:
            return (0...10).map { TableModel(id: $0, title: "Second \($0)") }
        }
    }
}


var restaurantView:RestaurantView?

var pubBarLogic:PubBarLogic?

class RestaurantView: UIViewController {
    var reservationFormDelegate: ReservationFormDelegate?
    
    @IBOutlet weak var tableReservation: UIButton!
    @IBOutlet weak var firstRoomView: UIView!
    @IBOutlet weak var secondRoomView: UIView!
    
    @IBAction func tableTapped(_ sender: UIButton) {
        if sender.tag == 1 {
            goToReserveForm()
        } else if sender.tag == 2 {
            goToReserveForm()
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tableReservation.backgroundColor = .green

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
        reservationVC.reservationFormDelegate = self
        self.present(reservationVC, animated: true, completion: nil)
    }
}

extension RestaurantView: ReservationFormDelegate {
    func didTapButton(label: String, color: UIColor) {
        tableReservation.setTitle(label, for: .normal)
        tableReservation.backgroundColor = color
    }
}
