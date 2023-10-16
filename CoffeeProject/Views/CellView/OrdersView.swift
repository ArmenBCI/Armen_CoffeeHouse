//
//  OrdersView.swift
//  CoffeeProject
//
//  Created by Yurka Babayan on 08.09.23.
//

import SwiftUI

struct OrdersView: View {
    @StateObject var viewModel: OrderViewModel
    
    var statuses: [String] {
        var sts = [String]()
        
        for status in OrderStatus.allCases {
            sts.append(status.rawValue)
        }
        return sts
    }
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 5){
            
            VStack(alignment: .leading, spacing: 5) {
                Text("\(viewModel.user.name)")
                    .font(.title3)
                    .fontWeight(.bold)
                Text("+374 \(viewModel.user.phone)")
                    .bold()
                Text("\(viewModel.user.adress)")
            }
            .padding(.horizontal, 8)
            .padding(.bottom)
            
            
//            Picker(selection: self.$viewModel.order.status) {
//                ForEach(statuses, id: \.self) { status in
//                    Text(status)
//                }
//            } label: {
//                Text("Statuses")
//            }
//            .pickerStyle(.segmented)
//
//            .onChange(of: self.viewModel.order.status) { newStatus in
//                DataBaseService.shared.setOrder(order: viewModel.order) { result in
//                    switch result {
//                    case .success(let order):
//                        print(order.status)
//                    case .failure(let error):
//                        print(error.localizedDescription)
//                    }
//                }
//            }
//
//
//            .padding(.bottom)
            
            
            
            List {
                ForEach(viewModel.order.positions, id: \.id) { position in
                    PossitionCell(position: position)
                }
                Text("ընդամենը: \(viewModel.order.cost) AMD")
                    .font(.title3.bold())
            }
            .cornerRadius(17)
        }
        .padding()
        .onAppear {
            viewModel.getUserData()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("TextFieldGray"))
        .environment(\.colorScheme, .dark)
    }
}

struct OrdersView_Previews: PreviewProvider {
    static var previews: some View {
        OrdersView(viewModel:  OrderViewModel(order: Order(id: UUID().uuidString,
                                                           userID: "",
                                                           date: Date(),
                                                           status: "New")))
    }
}
