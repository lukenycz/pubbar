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
        var result:Result?
        
        do {
        let jsonData = try Data(contentsOf: url)
            result = try JSONDecoder().decode(Result.self, from: jsonData)
            
            if let result = result {
                print(result)
            } else {
                print("Failed to pase")
            }
            return
        } catch {
            print("Error: \(error)")
        }
    }

}

struct Result:Codable {
    let data:[ResultItem]
}

struct ResultItem:Codable {
    let name: String
    let description: String
    let price: Int
}
