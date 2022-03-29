//
//  ContentView.swift
//  TacoShop
//
//  Created by NEW on 3/28/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var meat = 0
    let meats = ["Asada", "Pastor", "Cabeza"]
    
    @State private var quantity = 2
    
    @State private var specialRequest = false
    @State private var cilantroAndOnions = false
    @State private var salsa = false
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Select your meat", selection: $meat) {
                        ForEach(meats.indices) {
                            Text(meats[$0])
                        }
                    }
                    Stepper("Number of tacos: \(quantity)", value: $quantity, in: 2...20)
                }
                
                Section {
                    Toggle("Special request?", isOn: $specialRequest)
                    if specialRequest {
                        Toggle("Cilantro and onions", isOn: $cilantroAndOnions)
                        Toggle("Salsa", isOn: $salsa)
                    }
                        
                }

                Section {
                    NavigationLink {
                        Text("your order of \(quantity) \(meats[meat]) is on its way")
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
