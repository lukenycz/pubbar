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

//var pubBarLogic:PubBarLogic?

class RestaurantView: UIViewController {
    
    var reservationFormDelegate: ReservationFormDelegate!
    
    @IBOutlet weak var tableReservation1: UIButton!
    @IBOutlet weak var tableReservation2: UIButton!
    
    let reuseIdentifier = "cell"
        var items = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48"]
    var reservationFormDelegate: ReservationFormDelegate?
    
    @IBOutlet weak var tableReservation: UIButton!
    @IBOutlet weak var firstRoomView: UIView!
    @IBOutlet weak var secondRoomView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBAction func tableTapped(_ sender: UIButton) {
        goToReserveForm()
        if sender.tag == 1 {
            goToReserveForm()
        } else if sender.tag == 2 {
            goToReserveForm()
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //tableReservation.backgroundColor = .green
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


        
    }
    
    func tableView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.items.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            
            // get a reference to our storyboard cell
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! ReservationTableCollectionViewCell
            
            // Use the outlet in our custom class to get a reference to the UILabel in the cell
           cell.myLabel.text = self.items[indexPath.row]
            // The row value is the same as the index of the desired text within the array.
            cell.backgroundColor = UIColor.cyan // make cell more visible in our example project
            
            return cell
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

