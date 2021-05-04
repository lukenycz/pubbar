//
//  ReservationView.swift
//  PubBar
//
//  Created by Łukasz Nycz on 04/05/2021.
//

import UIKit

class ReservationView: UIViewController {

    @IBOutlet weak var firstRoomView: UIView!
    @IBOutlet weak var secondRoomView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        firstRoomView.isHidden = false
        secondRoomView.isHidden = true
       // let firstViewRoomlet = firstRoomView
        //firstViewRoomlet?.isHidden = true
        // Do any additional setup after loading the view.
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
