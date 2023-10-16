//
//  FavoriteView.swift
//  CoffeeProject
//
//  Created by Yurka Babayan on 22.08.23.
//

import SwiftUI

//struct FavoriteView: View {
//    
//    @StateObject var viewModel: CardViewModel
//    
//    var body: some View {
//        VStack {
//            HStack {
//                Text("Your")
//                    .font(.title)
//                    .fontWeight(.medium)
//                    .foregroundColor(.white)
//                Text("Favorites")
//                    .font(.title.bold())
//                    .foregroundColor(.white)
//            }
//            .padding(.top)
//            
//            ScrollView(.vertical, showsIndicators: false) {
//                ForEach(viewModel.positions, id: \.id) { item in
//                    FavoriteCell(viewModel: CardViewModel.shared, model: item)
//                }
//            }
//        }
//        .padding(.bottom, 55)
//        .frame(maxWidth: .infinity, maxHeight: .infinity)
//        .background(Color.black)
//        .environment(\.colorScheme, .dark)
//    }
//}
//
//struct FavoriteView_Previews: PreviewProvider {
//    static var previews: some View {
//        FavoriteView(viewModel: CardViewModel.shared)
//    }
//}
