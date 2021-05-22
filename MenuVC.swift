//
//  MenuVC.swift
//  PubBar
//
//  Created by Łukasz Nycz on 22/05/2021.
//

import UIKit

class MenuVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        parseJson()


    }
    private func parseJson() {
        guard let path = Bundle.main.path(forResource: "PubBarMenu", ofType: "json") else{
            return
        }
        
        let url = URL(fileURLWithPath: path)
        var menu:Menu?
        
        do {
        let jsonData = try Data(contentsOf: url)
            menu = try JSONDecoder().decode(Menu.self, from: jsonData)
            
            if let menu = menu {
                print(menu)
            } else {
                print("Failed to pase")
            }
            return
        } catch {
            print("Error: \(error)")
        }
    }

}

struct Menu:Codable {
    let menu:[MenuContains]?
}

struct MenuContains:Codable {
    let drinks:[Drinks]
    let softdrinks:[SoftDrinks]
    let snacks:[Snacks]
    let pizza:[Pizza]
}
struct Drinks:Codable {
    let name: String
    let description: String
    let price: Int
}
struct SoftDrinks:Codable {
    let name: String
    let description: String
    let price: Int
}
struct Snacks:Codable {
    let name: String
    let description: String
    let price: Int
}
struct Pizza:Codable {
    let name: String
    let description: String
    let price: Int
}
