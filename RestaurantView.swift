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
    
    @IBOutlet weak var tableReservation1: UIButton!
    @IBOutlet weak var tableReservation2: UIButton!
    @IBOutlet weak var firstRoomView: UIView!
    @IBOutlet weak var secondRoomView: UIView!
    
    @IBAction func tableTapped(_ sender: UIButton) {
        goToReserveForm()
        
        switch sender.tag {
        case whichButtonSender.first.rawValue:
            print("asd234")
        default:
            print("errror")
        }
        
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
        reservationVC.reservationFormDelegate = self
        self.present(reservationVC, animated: true, completion: nil)
    }
}

enum whichButtonSender: Int {
    case first
    case second
    case third
}

extension RestaurantView: ReservationFormDelegate {
    func didTapButton(label: String, color: UIColor, sender: Any) {
    
//            tableReservation1.setTitle(label, for: .normal)
//            tableReservation1.backgroundColor = color
   
//            tableReservation2.setTitle(label, for: .normal)
//            tableReservation2.backgroundColor = color
        
        switch sender {
        case whichButtonSender.first:
            tableReservation1.setTitle(label, for: .normal)
            tableReservation1.backgroundColor = color
        case whichButtonSender.second:
            tableReservation2.setTitle(label, for: .normal)
            tableReservation2.backgroundColor = color
        default:
            print("error")
        }
        
        
    }
    
        /*
        
        
        if (tableReservation1 != nil) {
            tableReservation1.setTitle(label, for: .normal)
            tableReservation1.backgroundColor = color
        } else if (tableReservation2 != nil) {
            tableReservation2.setTitle(label, for: .normal)
            tableReservation2.backgroundColor = color
        }
    }
    func whichButton(sender: Any) {
        if (sender as! NSObject) == tableReservation1 {
            print("firstbutton")
        } else if sender as? NSObject == tableReservation2 {            print("secondbutton")
        }
         */

}
