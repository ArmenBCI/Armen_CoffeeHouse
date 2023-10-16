//
//  ProfileView.swift
//  CoffeeProject
//
//  Created by Yurka Babayan on 24.08.23.
//

import SwiftUI

struct ProfileView: View {
    
    @State private var isAvaAlertPresented = false
    @State private var isQuitAlertPresented = false
    @State private var isAuthViewPresented = false
    
    @State private var trueOrders = true
    @StateObject var viewModel: ProfileViewModel
    
    var adresses: [String] {
        var adr = [String]()
        
        for adress in AdressStatus.allCases {
            adr.append(adress.rawValue)
        }
        return adr
    }
    
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "person")
                    .font(.system(size: 50))
                    .foregroundColor(.white)
                    .padding(30)
                    .background(Color("custRed"))
                    .clipShape(Circle())
                    .onTapGesture {
                        isAvaAlertPresented.toggle()
                    }
//                    .confirmationDialog("Change Photo", isPresented: self.$isAvaAlertPresented) {
//                        Button {
//                            print("Library")
//                        } label: {
//                            Text("Gallery")
//                        }
//
//                        Button {
//                            print("Camera")
//                        } label: {
//                            Text("Camera")
//                        }
//                    }
//                    .padding(.trailing)
                
                
                VStack(alignment: .leading, spacing: 6) {
                    
                    TextField("Name", text: self.$viewModel.profile.name)
                        .font(.title2.bold())
                    
                    HStack {
                        Text("+374")
                            .foregroundColor(.white)
                            .font(.title3)
                        
                        TextField("Phone", value: self.$viewModel.profile.phone, format: .number)
                            .font(.title3)
                    }
                }
            }
            .padding(.trailing)
            
            HStack {
                VStack(alignment: .leading) {
                    Text("Հասցե:")
                        .font(.title2.bold())
                        .foregroundColor(.white)
                        .padding(.trailing, 35)
                        .padding(.bottom, -3)
                    
                    Text(viewModel.profile.adress)
                }
                
                Spacer()
                VStack(alignment: .leading, spacing: 2) {
                    Button {
                        isQuitAlertPresented.toggle()
                    } label: {
                        Text("Դուրս գալ")
                            .font(.title3.bold())
                            .foregroundColor(.white)
                            .padding(8)
                            .padding(.horizontal, 6)
                            .background(Color("custRed"))
                            .cornerRadius(12)
                    }
                    .confirmationDialog("Sign Out", isPresented: self.$isQuitAlertPresented) {
                        Button {
                            isAuthViewPresented.toggle()
                        } label: {
                            Text("Այո")
                                .tint(Color("custRed"))
                        }
                    }
                    .fullScreenCover(isPresented: self.$isAuthViewPresented) {
                        AuthView()
                    }
                    
                }
            }
            .padding(.horizontal, 8)
            
            
//            HStack {
//                Text("Պատվերներ ⬇")
//                    .foregroundColor(.white)
//                    .font(.title2)
//
//                Spacer()
//            }
//            .padding(.horizontal, 20)
//            .padding(.top)
            
            Button {
                trueOrders.toggle()
            } label: {
                Text(trueOrders ? "Ընթացիկ պատվեներ" : "Պատրաստ պատվեներ")
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color(.black))
                    .cornerRadius(12)
            }
            .padding(2)
            .background(Color.white)
            .cornerRadius(12)
            .padding(.horizontal, 8)
            .padding(.bottom, 8)
        
            ScrollView(.vertical, showsIndicators: false) {
                if viewModel.orders.count == 0 {
                    
                    VStack(spacing: 20) {
                        
                        Text("Ձեր պատվեները")
                            .font(.largeTitle.bold())
                            .foregroundColor(.gray)
                    
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: Color("custRed")))
                            .scaleEffect(3)
                            .padding(.top, 50)
                    }
                    .offset(y: 150)
                } else {
                    ForEach(viewModel.orders, id: \.id) { order in
                        if trueOrders {
                            if order.status == "New" || order.status == "Getting Ready" {
                                OrderCell(order: order)
                            }
                        } else {
                            if order.status == "Complete" {
                                OrderCell(order: order)
                            }
                        }
                    }
                }
            }
            .refreshable {
                self.viewModel.getProfile()
                self.viewModel.getOrders()
            }
            .padding(.bottom, 60)
            //            VStack {
            //                Text("Your Orders Is Empty")
            //                    .font(.largeTitle)
            //                    .foregroundColor(.gray)
            //                Spacer()
            //            }
        }
        .onSubmit {
            viewModel.setProfile()
        }
        .onAppear {
            self.viewModel.getProfile()
            self.viewModel.getOrders()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black)
        .environment(\.colorScheme, .dark)
        .padding(.horizontal, 8)
    }
}

//struct ProfileView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProfileView(viewModel: ProfileViewModel(profile: YBUser(id: "",
//                                                                name: "Yurka Babayan",
//                                                                phone: 41146040,
//                                                                adress: "Shirak street 58/1")),
//               )
//    }
//}
