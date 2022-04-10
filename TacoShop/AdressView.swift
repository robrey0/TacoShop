//
//  AdressView.swift
//  TacoShop
//
//  Created by NEW on 4/10/22.
//

import SwiftUI

struct AdressView: View {
    @ObservedObject var order: Order
    
    var body: some View {
        Form {
            Section {
                TextField("Name", text: $order.name)
                TextField("Street Adress", text: $order.street)
                TextField("City", text: $order.city)
                TextField("Zip", text: $order.zip)
            }
            
            Section {
                    //print("your order of \(order.quantity) \(Order.meats[order.meat]) is on its way\nThanks \(order.name)")
                    NavigationLink {
                        CheckOutView(order: order)
                    } label : {
                        Text("CheckOut")
                    }
            }
        }
        .navigationTitle("Delivery Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct AdressView_Previews: PreviewProvider {
    static var previews: some View {
        AdressView(order: Order())
    }
}
