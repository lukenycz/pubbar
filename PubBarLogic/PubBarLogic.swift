//
//  PubBarLogic.swift
//  PubBar
//
//  Created by Łukasz Nycz on 06/05/2021.
//

import UIKit

class PubBarLogic: UIViewController {
    
    var restaurantView: RestaurantView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    enum reservationStatus {
        case freeTable
        case reservedTable
        case takenTable
        
        var status: Bool {
            switch self{
            case .freeTable:
                return true
            case .reservedTable:
                return true
            case .takenTable:
                return true
            default:
                return false
            }
        }
    }
    
    func buttonStatus(){
        let freeGreen = reservationStatus.freeTable
        let reservedGray = reservationStatus.reservedTable
        let takenTable = reservationStatus.takenTable
        
        if freeGreen.status {
        
        }

    }
}
