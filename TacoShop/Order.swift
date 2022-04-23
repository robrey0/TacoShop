//
//  Order.swift
//  TacoShop
//
//  Created by NEW on 4/10/22.
//

import Foundation

class Order: ObservableObject {
    
    init() {}
    
    enum CodingKeys: CodingKey {
        case meat, quantity, cilantroAndOnions, salsa, name, street, city, zip
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        meat = try container.decode(Int.self, forKey: .meat)
        quantity = try container.decode(Int.self, forKey: .quantity)
        cilantroAndOnions = try container.decode(Bool.self, forKey: .cilantroAndOnions)
        salsa = try container.decode(Bool.self, forKey: .salsa)
        name = try container.decode(String.self, forKey: .name)
        street = try container.decode(String.self, forKey: .street)
        city = try container.decode(String.self, forKey: .city)
        zip = try container.decode(String.self, forKey: .zip)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(meat, forKey: .meat)
        try container.encode(quantity, forKey: .quantity)
        try container.encode(cilantroAndOnions, forKey: .cilantroAndOnions)
        try container.encode(salsa, forKey: .salsa)
        try container.encode(name, forKey: .name)
        try container.encode(street, forKey: .street)
        try container.encode(city, forKey: .city)
        try container.encode(zip, forKey: .zip)
    }

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
