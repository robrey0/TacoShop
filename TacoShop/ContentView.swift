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
    
    @State private var quantity = 1
    
    @State private var specialRequest = false
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Select your meat", selection: $meat) {
                        ForEach(meats.indices) {
                            Text(meats[$0])
                        }
                    }
                    Stepper("Number of tacos: \(quantity)", value: $quantity, in: 1...20)
                }
                
                Section {
                    Toggle(isOn: $specialRequest) {
                        Text("Cilantro and Onions")
                    }
                }

                Section {
                    Button("Order") {
                        print("your tacos de \(meats[meat]) are on the way")
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
