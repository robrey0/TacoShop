//
//  ContentView.swift
//  TacoShop
//
//  Created by NEW on 3/28/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var order = Order()
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Select your meat", selection: $order.meat) {
                        ForEach(Order.meats.indices) {
                            Text(Order.meats[$0])
                        }
                    }
                    Stepper("Number of tacos: \(order.quantity)", value: $order.quantity, in: 2...20)
                }
                
                Section {
                    Toggle("Special request?", isOn: $order.specialRequest)
                    if order.specialRequest {
                        Toggle("Cilantro and onions", isOn: $order.cilantroAndOnions)
                        Toggle("Salsa", isOn: $order.salsa)
                    }
                        
                }

                Section {
                    NavigationLink {
                        AdressView(order: order)
                        //Text("your order of \(order.quantity) \(Order.meats[order.meat]) is on its way")
                    } label: {
                        Text("Order")
                    }
                }
            }
            .navigationTitle("Taco Shop")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
