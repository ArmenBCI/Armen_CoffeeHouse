//
//  ProductDetailView.swift
//  CoffeeProject
//
//  Created by Yurka Babayan on 18.08.23.
//

import SwiftUI

struct ProductDetailView: View {
    
    @State private var isTabViewShow: Bool = false
    @State private var likeButton: Bool = false
    @State private var sheetPrsented = false
    @State private var coffeeCount: Int = 1
    
    @State private var cofSize1: Bool = false
    @State private var cofSize2: Bool = false
    @State private var cofSize3: Bool = false
    
    @State private var isEmptyObjects: Bool = false
    
    @State private var locationViewIsresendet: Bool = false
    
    @State var size = ""
    
    @StateObject var viewMod: ProfileViewModel
    
    var adresses: [String] {
        var adr = [String]()
        
        for adress in AdressStatus.allCases {
            adr.append(adress.rawValue)
        }
        return adr
    }
    
    @StateObject var viewModel: CardViewModel
    
    let productViewModel: ProductDetailViewModel
    
    @Environment(\.presentationMode) var presentationMode
    
    let model: Product
    
    
    var body: some View {
        VStack {
            Spacer()
            //            HStack {
            //                Image("LargeLogo")
            //
            //                Spacer()
            //
            //                Button {
            //
            //                    likeButton.toggle()
            //
            //                    var possition = Possition(id: UUID().uuidString,
            //                                             product: model,
            //                                              count: self.coffeeCount)
            //
            //                    possition.product.price = model.price
            //
            //                    CardViewModel.shared.addPositions(possition)
            //                } label: {
            //                    Image(systemName: likeButton ? "heart.fill" : "heart")
            //                        .font(.title3)
            //                        .foregroundColor(likeButton ? Color("custRed"): .white)
            //                        .padding()
            //                        .background(Color("TextFieldGray"))
            //                        .foregroundColor(.white)
            //                        .cornerRadius(12)
            //                }
            //            }
            //            .padding(.top, 20)
            //            .padding(.horizontal)
            //
            //            Image(systemName: "arrow.down")
            //                .foregroundColor(.gray)
            //                .font(.system(size: 40))
            ////                .padding(.bottom)
            //            Spacer()
            
            Image("\(model.imageUrl).fill")
                .padding(.bottom, 20)
            
            //                .offset(y: -20)
            
            ZStack {
                VStack(spacing: 23) {
                    HStack {
                        Text("\(model.title)")
                            .foregroundColor(.white)
                            .font(.system(size: 25))
                        
                        Spacer()
                        
                        Text("\(model.price) AMD")
                            .foregroundColor(.white)
                            .font(.system(size: 25).bold())
                    }
                    
                    HStack {
                        HStack {
                            HStack {
                                Button {
                                    coffeeCount += 1
                                } label: {
                                    Image(systemName: "plus")
                                        .foregroundColor(.white)
                                        .padding(2)
                                        .font(.system(size: 23))
                                }
                                
                                Text("\(coffeeCount)")
                                    .foregroundColor(.white)
                                    .fontWeight(.bold)
                                
                                Button {
                                    if coffeeCount > 2 {
                                        coffeeCount -= 1
                                    } else {
                                        coffeeCount = 1
                                    }
                                } label: {
                                    Image(systemName: "minus")
                                        .foregroundColor(.white)
                                        .font(.system(size: 23))
                                        .padding(2)
                                }
                            }
                            .padding(8)
                            .background(Color("TextFieldGray"))
                            .cornerRadius(12)
                            
                        }
                        .padding(1)
                        .background(Color.white)
                        .cornerRadius(12)
                        
                        Spacer()
                        HStack {
//                            ZStack {
//                                TextField("Անուն", text: self.$viewMod.profile.name)
//                                    .font(.system(size: 17).bold())
//                                    .padding(10)
//                                    .background(Color("TextFieldGray"))
//                                    .cornerRadius(10)
//                            }
//                            .padding(1)
//                            .background(isEmptyObjects ? Color("custRed") : .white)
//                            .cornerRadius(10)
                            
                            ZStack {
                                HStack {
                                    Text("+ 374")
                                        .foregroundColor(.white)
                                        .font(.system(size: 15).bold())
                                        .padding(.leading, 2)
                                    
                                    TextField("հեռախոս", value: self.$viewMod.profile.phone, format: .number)
                                        .font(.system(size: 17).bold())
                                    
                                }
                                .padding(10)
                                .background(Color("TextFieldGray"))
                                .cornerRadius(10)
                            }
                            .padding(1)
                            .background(isEmptyObjects ? Color("custRed") : .white)
                            .cornerRadius(10)
                        }
                    }
                    VStack(alignment: .leading) {
                        HStack {
                            Text("Հասցե:")
                                .font(.title.bold())
                                .foregroundColor(.white)
                            
//
                            Text(viewMod.profile.adress)
                                .font(.system(size: 20))
                                .foregroundColor(.white)
//                            Button {
//                                locationViewIsresendet.toggle()
//                            } label: {
//                                Text(viewMod.profile.adress)
//                                    .foregroundColor(.white)
//                                    .font(.system(size: 15))
//                                    .fontWeight(.bold)
//                                    .padding(8)
//                                    .background(Color("TextFieldGray"))
//                                    .cornerRadius(12)
//                            }
//                            .padding(1)
//                            .background(Color.white)
//                            .cornerRadius(12)
//                            .sheet(isPresented: self.$locationViewIsresendet) {
//                                LocationView()
//                            }
//
//                            VStack(alignment: .trailing) {
//                                Picker(selection: self.$viewMod.profile.adress) {
//                                    ForEach(adresses, id: \.self) { adress in
//                                        Text(adress)
//                                    }
//                                } label: {
//                                    Text("Adresses")
//                                }
//                                .onChange(of: self.viewMod.profile.adress) { newAdress in
//                                    DataBaseService.shared.setProfile(user: viewMod.profile) { result in
//                                        switch result {
//                                        case .success(_):
//                                            print("On Submit!")
//                                        case .failure(let error):
//                                            print(error.localizedDescription)
//                                        }
//                                    }
//                                }
//                                .pickerStyle(.menu)
//                                .datePickerStyle(.compact)
//                                .foregroundColor(.white)
//                                .tint(Color.white)
//                            }
                        }
                        Text("\(model.descript) 180ml")
                            .lineLimit(19)
                            .foregroundColor(.gray)
                            .font(.system(size: 20))
                        
                        Button {
                            if viewMod.profile.name.isEmpty || viewMod.profile.phone.words.isEmpty {
                                isEmptyObjects.toggle()
                            } else {
                                var possition = Possition(id: UUID().uuidString,
                                                          product: model,
                                                          count: self.coffeeCount)
                                
                                possition.product.price = model.price
                                
                                CardViewModel.shared.addPositions(possition)
                                presentationMode.wrappedValue.dismiss()
                            }
                        } label: {
                            Text("Ավելացնել Զամբյուղ")
                                .foregroundColor(.white)
                                .font(.title2.bold())
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color("custRed"))
                                .cornerRadius(15)
                        }
                        //                        .padding(.top, 110)
                    }
                    //                    .padding(.top, 25)
                }
                .padding(.horizontal)
            }
            .onSubmit {
                viewMod.setProfile()
            }
            .onAppear {
                self.viewMod.getProfile()
                self.viewMod.getOrders()
            }
            .padding(.vertical, 30)
            .frame(maxWidth: .infinity)
            .background(Color("TextFieldGray"))
            .cornerRadius(15)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("custBlack"))
        .environment(\.colorScheme, .dark)
        
    }
    
}


struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView(viewMod: ProfileViewModel(profile: YBUser(id: "",
                                                                    name: "",
                                                                    phone: 0,
                                                                    adress: "")),
                          viewModel: CardViewModel.shared,
                          productViewModel: ProductDetailViewModel(product: Product(id: "2",
                                                                                    
                                                                                    title: "Esprsso",
                                                                                    imageUrl: "Capuchino",
                                                                                    price: 1800,
                                                                                    descript: "The is a large diversity in the world of coffee drinks so one may get confused when deciding what to order in a cafe.")), model: Product(id: "1",
                                                                                                                                                                                                                                        title: "Capuchino",
                                                                                                                                                                                                                                        imageUrl: "Capuchino",
                                                                                                                                                                                                                                        price: 1800,
                                                                                                                                                                                                                                        descript: "The is a large diversity in the world of coffee drinks so one may get confused when deciding what to order in a cafe."))
    }
}
