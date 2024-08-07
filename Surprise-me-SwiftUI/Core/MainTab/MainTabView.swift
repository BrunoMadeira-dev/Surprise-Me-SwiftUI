//
//  MainTabView.swift
//  Surprise-me-SwiftUI
//
//  Created by Bruno Madeira on 21/06/2024.
//

import SwiftUI

enum TabbedItems: Int, CaseIterable {
    case home
    case favorites
    case profile
    
    var iconName: String {
        switch self {
        case .home:
            return "house"
        case .favorites:
            return "favorites"
        case .profile:
            return "person"
        }
    }
    
    var title: String {
        switch self {
        case .home:
            return "Home"
        case .favorites:
            return "Favorites"
        case .profile:
            return "Profile"
        }
    }
}

struct MainTabView: View {
    
    @State private var selectedIndex = 0
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $selectedIndex) {
                ChooseView()
                    .tag(0)
                FavoritesView()
                    .tag(1)
                ProfileView()
                    .tag(2)
            }
            
            RoundedRectangle(cornerRadius: 25.0)
                .frame(width: 350, height: 70)
                .foregroundStyle(colorScheme == .light ? Color(.white) : Color(.darkGray))
                .shadow(radius: 10)
                .padding(.bottom, 15)
            
            HStack() {
                ForEach(TabbedItems.allCases, id: \.self) { items in
                    if items.rawValue != 1 {
                        Button {
                            selectedIndex = items.rawValue
                        } label: {
                            CustomTabItem(imageName: items.iconName, title: items.title, isActive: (selectedIndex == items.rawValue))
                        }
                    } else {
                        Button {
                            selectedIndex = 1
                        } label: {
                            SMBuyButton()
                                .frame(height: 70)
                        }
                    }
                }
            }
            .frame(height: 70)
            .padding(.bottom,15)
        }
    }
}

extension MainTabView {
    func CustomTabItem(imageName: String, title: String, isActive: Bool) -> some View{
        HStack(alignment: .center,spacing: 22){
            Spacer()
            Image(systemName: imageName)
                .resizable()
                .renderingMode(.template)
                .foregroundColor(isActive ? activeColor : inactiveColor)
                .frame(width: 25, height: 25)
            Spacer()
        }
    }
    
    private var activeColor: Color {
            switch colorScheme {
            case .light:
                return Color("lightBlueColor") // Cor para o modo claro quando ativo
            case .dark:
                return Color("lightBlueColor") // Cor para o modo escuro quando ativo
            default:
                return Color("lightBlueColor") // Padrão se necessário
            }
        }

        // Computando a cor inativa com base no esquema de cores
        private var inactiveColor: Color {
            switch colorScheme {
            case .light:
                return Color.gray.opacity(0.6) // Cor para o modo claro quando inativo
            case .dark:
                return Color.white.opacity(0.6) // Cor para o modo escuro quando inativo
            default:
                return Color.gray.opacity(0.6) // Padrão se necessário
            }
        }
}

#Preview {
    MainTabView()
}
