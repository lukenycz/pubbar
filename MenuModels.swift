//
//  MenuModels.swift
//  PubBar
//
//  Created by Łukasz Nycz on 23/05/2021.
//

import Foundation

struct Menu:Codable {
    let menu:[MenuContains]
}

struct MenuContains:Codable {
    let type:String?
    let items:[Items]
}
struct Items:Codable {
    let name: String
    let description: String
    let price: Int
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
