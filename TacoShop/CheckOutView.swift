//
//  CheckOutView.swift
//  TacoShop
//
//  Created by NEW on 4/10/22.
//

import SwiftUI

struct CheckOutView: View {
    
    @ObservedObject var order: Order
    
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
                
                Text("Your price is $99")
                
                Button("Place Order") {
                    placeOrder()
                }
            }
        }
        .navigationTitle("Check Out")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    func placeOrder() {
        print("thanks we aprrieciate our customers")
    }
}

struct CheckOutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckOutView(order: Order())
    }
}
