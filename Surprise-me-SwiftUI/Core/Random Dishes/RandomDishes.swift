//
//  RandomDishes.swift
//  Surprise-me-SwiftUI
//
//  Created by Bruno Madeira on 25/06/2024.
//

import SwiftUI
import Kingfisher

struct RandomDishes: View {
    
    @State var searchField = ""
    var urlRandomFood = "https://www.themealdb.com/api/json/v1/1/random.php?"
    @State var randomMeal: MealDataModel?
    @State var rectangleHeight: CGFloat = 230
    @State private var downloadedImage: Image? = nil
    @State private var isImageTapped: Bool = false
    @State private var opacityImage: Double = 0.0
    //@Binding var randomDishPressed: Bool 
    @State private var isLoading: Bool = false
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
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
                .frame(height: rectangleHeight)
                .clipShape(RoundedShape(corners: [.bottomLeft, .bottomRight]))
                .overlay(Button {
                    withAnimation((.smooth(duration: 0.5, extraBounce: 10))) {
                        dismiss()
                        //randomDishPressed = false
                    }
                } label: {
                    SMBackButton()
                        .padding(.top, 50)
                        .padding(.leading, 20)
                }, alignment: .topLeading)
                
                // Indicador de carregamento
                if isLoading {
                    ProgressView("Carregando...") // Exibe um indicador de carregamento
                        .progressViewStyle(CircularProgressViewStyle(tint: Color("lightBlueColor"))) // Estilo do indicador
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(Color.white.opacity(0.8)) // Fundo semi-transparente
                        .zIndex(2) // Coloca o indicador acima dos outros elementos
                }
                
                Button {
                    fetchRandomMeal(url: urlRandomFood, completion: { random in
                        randomMeal = random
                        
                        if let imageUrl = random.meals[0].strMealThumb {
                            RemoteImage().downloadImage(url: imageUrl) { image in
                                self.downloadedImage = image
                                withAnimation {
                                    self.opacityImage = 1.0
                                    self.isImageTapped = true
                                }
                            }
                        }
                    })
                } label: {
                    SMButton(title: "Teste")
                }
                Spacer()
            }
            .blur(radius: isImageTapped ? 10 : 0)
            .ignoresSafeArea()
            
            if isImageTapped, let image = downloadedImage {
                withAnimation(.smooth(duration: 2.0)) {
                    RandomDisheImage(isPresented: $isImageTapped, randomMeal: randomMeal, image: image)
                        .zIndex(1)
                }
            }
        }
        .navigationBarBackButtonHidden(true)
}
    
    func fetchRandomMeal(url: String, completion: @escaping (MealDataModel) -> ()) {
        DataManager().fetchRandomFood(url: url) { result, error in
            if let error = error {
                print("DEBUG: There was an error in: \(error.localizedDescription)")
            }
            
            if let randomMeal = result {
                completion(randomMeal)
            }
            print("DEBUG: Meal name is: \(randomMeal!.meals[0].strMeal ?? "Nothing!")")
        }
        
    }
}

#Preview {
    RandomDishes( randomMeal: MockData.sampleData)
}
