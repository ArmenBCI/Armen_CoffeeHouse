//
//  OrderCell.swift
//  CoffeeProject
//
//  Created by Yurka Babayan on 29.08.23.
//

import SwiftUI
import Firebase

struct OrderCell: View {
    
    var order: Order
    @State var sheetShow = false
    
    var body: some View {
        HStack {
            Image("box")
                .resizable()
                .frame(width: 70, height: 70)
                .padding(8)
                .padding(.horizontal, 8)
                .background(Color("TextFieldGray"))
                .cornerRadius(12)
                .padding()
            
            VStack(alignment: .leading, spacing: 3) {
                Text("\(order.date)")
                    .foregroundColor(.white)
                if order.status == "New" {
                    Text("\(order.status)")
                        .foregroundColor(.blue)
                } else if order.status == "Getting Ready" {
                    Text("\(order.status)")
                        .foregroundColor(.yellow)
                } else if order.status == "Complete" {
                    Text("\(order.status)")
                        .foregroundColor(.green)
                } else if order.status == "Canceled" {
                    Text("\(order.status)")
                    .foregroundColor(.red)
                }
                Text("\(order.cost) AMD")
                    .foregroundColor(.white)
                    .font(.title3.bold())
            }
            .padding(.vertical)
        }
        .sheet(isPresented: self.$sheetShow, content: {
            if let user = AuthServise.shared.currentUser {
                if user.uid == "6HAl9SjLwARo4DUMN6YUAGkZdOc2" {
                    OrderView(viewModel: OrderViewModel(order: order))
                } else {
                    OrdersView(viewModel: OrderViewModel(order: order))
                }
            }
        })
        .frame(maxWidth: .infinity)
        .background(Color("TextFieldGray").opacity(0.9))
        .cornerRadius(12)
        .padding(.horizontal, 8)
        .onTapGesture {
            sheetShow.toggle()
        }
        
    }
}

//struct OrderCell_Previews: PreviewProvider {
//    static var previews: some View {
//        OrderCell()
//    }
//}
