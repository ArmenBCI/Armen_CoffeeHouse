//
//  AdminOrdersView.swift
//  CoffeeProject
//
//  Created by Yurka Babayan on 30.08.23.
//

import SwiftUI

struct AdminOrdersView: View {
    
    @StateObject var viewModel = AdminOrdersViewModel()
    @State var orderViewShow = false
    @State var isShowAuthView = false
    @State private var reffresGear = false
    
    var body: some View {
        
        VStack {
            HStack {
                Text("Only Orders ⬇️")
                    .font(.title2.bold())
                    .foregroundColor(.white)
                    .padding(.top, 8)
                    .padding(.bottom)
                
                Spacer()
                
                Button {
                    AuthServise.shared.signOut()
                    isShowAuthView.toggle()
                } label: {
                    Text("Դուրս գալ")
                        .font(.system(size: 17))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(10)
                        .background(Color("custRed"))
                        .cornerRadius(12)
                }
                
                //                Button {
                //                    viewModel.getOrders()
                //                } label: {
                //                    Image(systemName: "arrow.clockwise")
                //                        .font(.title2.bold())
                //                        .foregroundColor(.white)
                //                        .padding(10)
                //                        .background(Color.green)
                //                        .clipShape(Circle())
                //                }
            }
            .padding(.horizontal)
            .padding(.top)
            
            Button {
                viewModel.getOrders()
            } label: {
                Text("Հաստատել")
                    .foregroundColor(.green)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.black)
                    .cornerRadius(12)
            }
            .padding(2)
            .background(Color.green)
            .cornerRadius(12)
            .padding(.horizontal, 8)
            .padding(.bottom)

            
            ScrollView(.vertical, showsIndicators: false) {
                ForEach(viewModel.orders, id: \.id) { order in
                    OrderCell(order: order)
                        .onTapGesture {
                            viewModel.currentOrder = order
                            orderViewShow.toggle()
                        }
                }
            }
            .refreshable {
                viewModel.getOrders()
            }
            .progressViewStyle(CircularProgressViewStyle(tint: Color("custRed")))
            .onAppear {
                viewModel.getOrders()
            }
            .sheet(isPresented: self.$orderViewShow) {
                let orderViewModel = OrderViewModel(order: viewModel.currentOrder)
                OrderView(viewModel: orderViewModel)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black)
        .environment(\.colorScheme, .dark)
        .fullScreenCover(isPresented: self.$isShowAuthView) {
            AuthView()
        }
    }
}

struct AdminOrdersView_Previews: PreviewProvider {
    static var previews: some View {
        AdminOrdersView()
    }
}
