//
//  RandomDisheImage.swift
//  Surprise-me-SwiftUI
//
//  Created by Bruno Madeira on 26/07/2024.
//

import SwiftUI

struct RandomDisheImage: View {
    
    @Binding var isPresented: Bool
    @State var randomMeal: MealDataModel?
    @State var image: Image?
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            VisualEffectBlur(blurStyle: .systemUltraThinMaterial)
                .ignoresSafeArea()
                .onTapGesture {
                    withAnimation((.smooth)) {
                        isPresented = false
                    }
                }
            
            VStack {
                VStack {
                    if let image = image {
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .clipShape(.rect(cornerRadius: 10))
                            .frame(width: 200, height: 200)
                            .clipped()
                            .shadow(radius: 10, x: 15, y: 10)
                            .padding(.top, 30)
                    } else {
                        Image("food_test")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .clipShape(.rect(cornerRadius: 10))
                            .frame(width: 200, height: 200)
                            .clipped()
                            .shadow(radius: 10, x: 15, y: 10)
                            .padding(.top, 30)
                    }
                }
                ScrollView {
                    LazyVStack(alignment: .leading) {
                        RecipeDetails(fixedType: "Name:", dynamicRecipe: randomMeal?.meals[0].strMeal ?? "No name available")
                            .padding(.top, 20)
                        RecipeDetails(fixedType: "Category:", dynamicRecipe: randomMeal?.meals[0].strCategory ?? "No category available")
                            .padding(.top, 20)
                        RecipeDetails(fixedType: "Country:", dynamicRecipe: randomMeal?.meals[0].strArea ?? "No country available")
                            .padding(.top, 20)
                        
                        Text("Instructions:")
                            .fontWeight(.semibold)
                            .font(.headline)
                            .padding(.top, 20)
                        
                        Text(randomMeal?.meals[0].strInstructions ?? "No instructions available")
                            .fontDesign(.serif)
                            .padding(.top, 5)
                    }
                    .padding(20)
                }
                Spacer()
            }
            .frame(width: 350, height: 620)
            .background(Color(.systemBackground))
            .clipShape(.rect(cornerRadius: 12))
            .shadow(radius: 100)
            .overlay(Button {
                withAnimation((.smooth)) {
                    isPresented = false
                }
            } label: {
                SMDismissButton()
            }, alignment: .topTrailing)
            
        }
    }
}

#Preview {
    RandomDisheImage(isPresented: .constant(true))
}

struct RecipeDetails: View {
    let fixedType: String
    let dynamicRecipe: String
    
    var body: some View {
        HStack {
            Text(fixedType)
                .fontWeight(.semibold)
                .font(.headline)
            Text(dynamicRecipe)
                .fontDesign(.serif)
        }
    }
}
