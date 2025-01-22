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
    @State private var selectedTab = 0
    @State private var imageScale: CGFloat = 200
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                VisualEffectBlur(blurStyle: .systemUltraThinMaterial)
                    .ignoresSafeArea()
                    .onTapGesture {
                        withAnimation((.smooth)) {
                            isPresented = false
                        }
                    }
                VStack {
                    Picker("Select Tab", selection: $selectedTab) {
                        Text("Recipe").tag(0)
                        Text("Ingridients").tag(1)
                    }
                    .pickerStyle(.segmented)
                    .padding(.top, 35)
                    .padding(.trailing, 35)
                    .padding(.leading, 35)
                    
                    if selectedTab == 1 {
                        IngridientsView()
                        Spacer()
                    } else {
                        ScrollView {
                            VStack {
                                if let image = image {
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .clipShape(.rect(cornerRadius: 10))
                                        .frame(width: min(imageScale, geometry.size.width * 0.8), height: min(imageScale, geometry.size.width * 0.8))
                                        .clipped()
                                        .shadow(radius: 10, x: 15, y: 10)
                                        .padding(.top, 30)
                                } else {
                                    Image("food_test")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .clipShape(.rect(cornerRadius: 10))
                                        .frame(width: min(imageScale, geometry.size.width * 0.8), height: min(imageScale, geometry.size.width * 0.8))
                                        .clipped()
                                        .shadow(radius: 10, x: 15, y: 10)
                                        .padding(.top, 30)
                                }
                            }
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
                            .onChange(of: imageScale) { oldValue, newValue in
                                withAnimation {
                                    imageScale = 100
                                }
                            }
                            
                        }
                        Spacer()
                    }
                }
                .frame(width: getScreenBounds().width * 0.9, height: getScreenBounds().height * 0.75)
                .background(Color(.systemBackground))
                .clipShape(.rect(cornerRadius: 12))
                .padding(.bottom, 120)
                .shadow(radius: 100)
                .overlay(Button {
                    withAnimation((.smooth)) {
                        isPresented = false
                    }
                } label: {
                    SMDismissButton()
                }, alignment: .topTrailing)
                .padding(.top, 20)
                
            }
            .zIndex(1)
        }
    }
}

#Preview {
    RandomDisheImage(isPresented: .constant(true))
}

extension View{
   func getScreenBounds() -> CGRect{
   return UIScreen.main.bounds
   }
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
