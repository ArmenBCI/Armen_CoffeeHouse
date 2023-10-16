//
//  MainTabBar.swift
//  CoffeeProject
//
//  Created by Yurka Babayan on 17.08.23.
//

import SwiftUI


enum Tab: String, CaseIterable {
    case house
//    case heart
    case cart
    case map
    case person
}

struct CustomTabBar: View {
    
    @Binding var selectedTab: Tab
    
    private var fillImage: String {
        selectedTab.rawValue + ".fill"
    }
    
    var body: some View {
        VStack {
            HStack {
                ForEach(Tab.allCases, id: \.rawValue) { tab in
                    Spacer()
                    Image(systemName: selectedTab == tab ? fillImage : tab.rawValue)
                        .scaleEffect(tab == selectedTab ? 1.25 : 1.0)
                        .foregroundColor(selectedTab == tab ? Color("custRed") : .white)
                        .font(.system(size: 25))
                        .onTapGesture {
                            withAnimation(.easeIn(duration: 0.09)) {
                                selectedTab = tab
                            }
                        }
                    Spacer()
                       
                }
            }
            .frame(width: nil, height: 60)
            .ignoresSafeArea()
            .background(Color.black)
            .cornerRadius(10)
            .padding(.horizontal)
            .environment(\.colorScheme, .dark)
        }
    }
}

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabBar(selectedTab: .constant(.house))
    }
}
