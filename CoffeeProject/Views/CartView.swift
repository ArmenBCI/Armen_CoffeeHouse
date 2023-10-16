//
//  CartView.swift
//  CoffeeProject
//
//  Created by Yurka Babayan on 20.08.23.
//

import SwiftUI

struct CartView: View {
    
    @StateObject var viewModel: CardViewModel
    @State private var alertMessage: Bool = false
    
    var body: some View {
        VStack {
            Text("Պատվերներ")
                .font(.title.bold())
                .foregroundColor(.white)
                .padding(.top)
            
            ScrollView(.vertical, showsIndicators: false) {
                ForEach(viewModel.positions, id: \.id) { item in
                    CardCell(viewModel: CardViewModel.shared, model: item)
                }
            }
            
            HStack {
                Text("ընդամենը")
                    .font(.title3)
                    .foregroundColor(.white)
                
                Spacer()
                
                Text("\(viewModel.cost) AMD")
                    .font(.title2.bold())
                    .foregroundColor(.white)
            }
            .padding(.horizontal)
            
            Button {
                if viewModel.cost != 0 {
                    alertMessage = true
                    
                    var order = Order(id: UUID().uuidString,
                                      userID: AuthServise.shared.currentUser!.uid,
                                      date: Date() ,
                                      status: OrderStatus.new.rawValue)
                    order.positions = self.viewModel.positions
                    
                    DataBaseService.shared.setOrder(order: order) { result in
                        switch result {
                        case .success(let order):
                            print(order.cost)
                        case .failure(let error):
                            print(error.localizedDescription)
                        }
                    }
                    viewModel.positions.removeAll()
                }
            } label: {
                Text("Գրանցել պատվերը")
                    .font(.title2.bold())
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color("custRed"))
                    .cornerRadius(12)
                    .padding()
            }
            .alert("Ձեր պատվերը հաստատված է",isPresented: self.$alertMessage) {
                Button("OK", role: .cancel) { }
            }
            
            
        }
        .padding(.bottom, 55)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black)
        .environment(\.colorScheme, .dark)
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView(viewModel: CardViewModel.shared)
    }
}
