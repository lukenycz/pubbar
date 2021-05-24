//
//  MenuVC.swift
//  PubBar
//
//  Created by Łukasz Nycz on 22/05/2021.
//

import UIKit

class MenuVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var menu:Menu?
    
    private let tableView: UITableView = {
        let table = UITableView(frame: .zero,
                                style: .grouped)
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        parseJson()
        view.addSubview(tableView)
        tableView.frame = view.bounds
        tableView.delegate = self
        tableView.dataSource = self

    }
    // TableView
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return menu?.menu.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return menu?.menu[section].drinks.description
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let menu = menu {
           return menu.menu[section].drinks.count
           // menu.menu![section].softdrinks.count
           // menu.menu![section].snacks.count
           // menu.menu![section].pizza.count
        }
        return 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let name = menu?.menu[indexPath.section].drinks[indexPath.item].name
        let description = menu?.menu[indexPath.section].drinks[indexPath.item].description
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = name
        cell.detailTextLabel?.text = description
        return cell
    }
    
    // JSON
    private func parseJson() {
        guard let path = Bundle.main.path(
                forResource: "PubBarMenu",
                ofType: "json"
        ) else {
            return
        }
        
        let url = URL(fileURLWithPath: path)
        
        do {
        let jsonData = try Data(contentsOf: url)
            menu = try JSONDecoder().decode(Menu.self, from: jsonData)            
         /*  //
            if let menu = menu {
                print(menu)
            } else {
                print("Failed to pase")
            }
            return
           */ //
        } catch {
            print("Error: \(error)")
        }
    }

}


