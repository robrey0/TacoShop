//
//  CheckOutView.swift
//  TacoShop
//
//  Created by NEW on 4/10/22.
//

import SwiftUI

struct CheckOutView: View {
    
    @ObservedObject var order: Order
    
    @State private var isShowingAlert = false
    @State private var message = ""
    
    var body: some View {
        ScrollView {
            VStack {
                AsyncImage(url: URL(string:"https://www.tacobell.co.in/pub/media/catalog/category/banner-2_taco_meal_veg_4.jpg"), scale: 3) { image in
                    image
                        .resizable()
                        .scaledToFit()
                } placeholder: {
                    ProgressView()
                }
                .frame(height: 233)
                
                Text("Your price is $\(order.cost)")
                
                Button("Place Order") {
                    placeOrder()
                }
            }
        }
        .navigationTitle("Check Out")
        .navigationBarTitleDisplayMode(.inline)
        .alert("thanks for your business", isPresented: $isShowingAlert) {
            Button("Okay") { }
        } message: {
            Text(message)
        }

    }
    
    func placeOrder() {
        guard let encoded = try? JSONEncoder().encode(order) else {
            print("Failed to encode object.")
            return
        }
        
        let url = URL(string: "https://reqres.in/api/tacoshop")!
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.uploadTask(with: urlRequest, from: encoded) { data, res, err in
            if let data = data {
                let decoded = try? JSONDecoder().decode(Order.self, from: data)
                
                message = "Your \(order.quantity) tacos of \(Order.meats[decoded!.meat]) are on there way!\nThanks \(decoded!.name)"
                isShowingAlert = true
            }
            
            if let _ = err {
                print("err rrrr")
            }
        }.resume()
    }
}

struct CheckOutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckOutView(order: Order())
    }
}
