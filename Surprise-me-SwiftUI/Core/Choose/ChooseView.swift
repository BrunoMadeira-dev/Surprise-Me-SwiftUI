//
//  ChooseView.swift
//  Surprise-me-SwiftUI
//
//  Created by Bruno Madeira on 21/06/2024.
//

import SwiftUI

struct ChooseView: View {
    @State private var randomDishPressed: Bool = false
    var body: some View {
        NavigationStack {
            VStack {
                VStack {
                    HStack { Spacer() }
                    Image("surprise-me-white-transparent")
                        .resizable()
                        .scaledToFit()
                        .padding(.top, 70)
                        .padding(.bottom, 15)
                }
                .background(Color("lightBlueColor"))
                .frame(height: 230)
                .clipShape(RoundedShape(corners: [.bottomLeft, .bottomRight]))
                
                
                NavigationLink(destination: {
                    RandomDishes(randomMeal: MockData.sampleData)
                }, label: {
                    SMButton(title: "Random Dish")
                }) 
                .padding(.top, 20)
                
//                Button(action: {
//                    randomDishPressed = true
//                }, label: {
//                    SMButton(title: "Random Dish")
//                })
//                .fullScreenCover(isPresented: $randomDishPressed, content: {
//                    RandomDishes(randomMeal: MockData.sampleData)
//                })
                
                Button(action: {
                    
                }, label: {
                    SMButton(title: "Food Category")
                })
                .padding(.top, 20)

                
                Spacer()
            }
            .ignoresSafeArea()
        }
    }
}

#Preview {
    ChooseView()
}
