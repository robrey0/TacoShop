//
//  Order.swift
//  TacoShop
//
//  Created by NEW on 4/10/22.
//

import Foundation

class Order: ObservableObject {
    @Published var meat = 0
    static let meats = ["Asada", "Pastor", "Cabeza"]
    
    @Published var quantity = 2
    
    @Published var specialRequest = false
    @Published var cilantroAndOnions = false
    @Published var salsa = false
    
    @Published var name = ""
    @Published var street = ""
    @Published var city = ""
    @Published var zip = ""
}
