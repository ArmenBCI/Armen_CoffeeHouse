//
//  CatalogView.swift
//  CoffeeProject
//
//  Created by Yurka Babayan on 17.08.23.
//

import SwiftUI

struct CatalogView: View {
    
    @State private var search: String = ""
    
    @State private var all: Bool = true
    @State private var capuchino: Bool = false
    @State private var macCoffee: Bool = false
    @State private var espresso: Bool = false
    @State private var animationCat: Bool = false
    @State private var hay: Bool = false
    @State private var hay1: Bool = false
    @State private var hay2: Bool = false
    
    @State var scrollViewOfset: CGFloat = 0
    @State var startOffset: CGFloat = 0
    
    @State var on = false
    
    let loyaut = GridItem(.adaptive(minimum: screen.width / 2.4))
    let model: Product
    
    var body: some View {
        VStack {
            Image("LargeLogo")
                .offset(y: 10)
            
            TextField("", text: self.$search, prompt: Text("Որոնում")
                .foregroundColor(.white))
            .foregroundColor(.white)
            .padding(22)
            .background(Color("TextFieldGray"))
            .cornerRadius(10)
            .padding(.top)
            .padding(.horizontal, 10)
            .onTapGesture {
                all = true
                capuchino = false
                macCoffee = false
                espresso = false
                hay1 = false
                hay2 = false
                hay = false
                animationCat.toggle()
            }
            
            HStack {
                Text("Մեր տեսականին")
                    .foregroundColor(.white)
                    .font(.title2)
                    .fontWeight(.medium)
                    .padding(.leading, 5)
                Spacer()
            }
            .padding(.top, 10)
            .padding(.horizontal, 10)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    
                    ZStack {
                        Text("All")
                            .foregroundColor(all ? Color("custRed") : .white)
                            .font(.system(size: 17).bold())
                            .padding()
                            .padding(.horizontal, 10)
                            .background(Color.black)
                            .cornerRadius(10)
                            .onTapGesture {
                                on.toggle()
                                all = true
                                capuchino = false
                                macCoffee = false
                                espresso = false
                                hay = false
                                hay1 = false
                                hay2 = false
                                animationCat.toggle()
                            }
                        
                    }
                    .padding(2)
                    .background(all ? Color("custRed") : Color.white)
                    .cornerRadius(10)
                    
                    
                    ZStack {
                        Text("Սուրճերի Միքս")
                            .foregroundColor(macCoffee ? Color("custRed") : .white)
                            .font(.system(size: 17).bold())
                            .padding()
                            .background(Color.black)
                            .cornerRadius(10)
                            .onTapGesture {
                                on.toggle()
                                animationCat.toggle()
                                macCoffee = true
                                all = false
                                capuchino = false
                                espresso = false
                                hay = false
                                hay1 = false
                                hay2 = false
                            }
                        
                    }
                    .padding(2)
                    .background(macCoffee ? Color("custRed") : Color.white)
                    .cornerRadius(10)
                    
                    ZStack {
                        Text("Էսպրեսոյի հիմքով")
                            .foregroundColor(capuchino ? Color("custRed") : .white)
                            .font(.system(size: 17).bold())
                            .padding()
                            .background(Color.black)
                            .cornerRadius(10)
                            .onTapGesture {
                                on.toggle()
                                animationCat.toggle()
                                capuchino = true
                                all = false
                                macCoffee = false
                                espresso = false
                                hay = false
                                hay1 = false
                                hay2 = false
                            }
                    }
                    .padding(2)
                    .background(capuchino ? Color("custRed") : Color.white)
                    .cornerRadius(10)
                    
                    
                    ZStack {
                        Text("Լիմոնադներ և Թեյեր")
                            .foregroundColor(hay ? Color("custRed") : .white)
                            .font(.system(size: 17).bold())
                            .padding()
                            .background(Color.black)
                            .cornerRadius(10)
                            .onTapGesture {
                                on.toggle()
                                animationCat.toggle()
                                espresso = false
                                all = false
                                capuchino = false
                                macCoffee = false
                                hay = true
                                hay1 = false
                                hay2 = false
                            }
                        
                    }
                    .padding(2)
                    .background(hay ? Color("custRed") : Color.white)
                    .cornerRadius(10)
                    
                    ZStack {
                        Text("Սմուզի")
                            .foregroundColor(hay1 ? Color("custRed") : .white)
                            .font(.system(size: 17).bold())
                            .padding()
                            .background(Color.black)
                            .cornerRadius(10)
                            .onTapGesture {
                                on.toggle()
                                animationCat.toggle()
                                hay1 = true
                                espresso = false
                                all = false
                                capuchino = false
                                macCoffee = false
                                hay = false
                                hay2 = false
                            }
                        
                    }
                    .padding(2)
                    .background(hay1 ? Color("custRed") : Color.white)
                    .cornerRadius(10)
                    
                    ZStack {
                        Text("Կաթնային Շեյքեր")
                            .foregroundColor(hay2 ? Color("custRed") : .white)
                            .font(.system(size: 17).bold())
                            .padding()
                            .background(Color.black)
                            .cornerRadius(10)
                            .onTapGesture {
                                on.toggle()
                                animationCat.toggle()
                                hay2 = true
                                espresso = false
                                all = false
                                capuchino = false
                                macCoffee = false
                                hay = false
                                hay1 = false
                            }
                        
                    }
                    .padding(2)
                    .background(hay2 ? Color("custRed") : Color.white)
                    .cornerRadius(10)
                }
                .animation(Animation.easeInOut(duration: 0.1), value: animationCat)
            }
            .padding(.leading, 10)
            
            ScrollViewReader { proxyReader in
                ScrollView(.vertical, showsIndicators: false) {
                    LazyVGrid(columns: [loyaut]) {
                        if all {
                            ForEach(CatalogViewModel.shared.allProducts.filter({
                                "\($0)".contains(search) || search.isEmpty
                            }), id: \.id) { item in
                                
                                ProductCell(model: item)
                            }
                        } else if capuchino {
                            ForEach(CatalogViewModel.shared.esspresoBace.filter({
                                "\($0)".contains(search.lowercased()) || "\($0)".contains(search.uppercased()) || search.isEmpty
                            }), id: \.id) { item in
                                
                                ProductCell(model: item)
                            }
                        } else if macCoffee {
                            ForEach(CatalogViewModel.shared.coffeeMix.filter({
                                "\($0)".contains(search.lowercased()) || "\($0)".contains(search.uppercased()) || search.isEmpty
                            }), id: \.id) { item in
                                
                                ProductCell(model: item)
                            }
                        } else if hay1 {
                            ForEach(CatalogViewModel.shared.limonad.filter({
                                "\($0)".contains(search.lowercased()) || "\($0)".contains(search.uppercased()) || search.isEmpty
                            }), id: \.id) { item in
                                
                                ProductCell(model: item)
                            }
                        } else if hay {
                            ForEach(CatalogViewModel.shared.smusy.filter({
                                "\($0)".contains(search.lowercased()) || "\($0)".contains(search.uppercased()) || search.isEmpty
                            }), id: \.id) { item in
                                
                                ProductCell(model: item)
                            }
                        } else if hay2 {
                            ForEach(CatalogViewModel.shared.milkShake.filter({
                                "\($0)".contains(search.lowercased()) || "\($0)".contains(search.uppercased()) || search.isEmpty
                            }), id: \.id) { item in
                                
                                ProductCell(model: item)
                            }
                        }
                    }
                    
                    .id("Scroll_to_top")
                    .overlay(
                        GeometryReader { proxy -> Color in
                            
                            DispatchQueue.main.async {
                                
                                if startOffset == 0 {
                                    self.startOffset = proxy.frame(in: .global).minY
                                }
                                
                                let offset = proxy.frame(in: .global).minY
                                self.scrollViewOfset = offset - startOffset
                                if on {
                                    proxyReader.scrollTo("Scroll_to_top", anchor: .top)
                                    on = false
                                }
                                print(self.scrollViewOfset)
                            }
                            return Color.clear
                        }
                            .frame(width: 0, height: 0)
                        , alignment: .top
                    )
                }
                
                .overlay(
                    Button(action: {
                        withAnimation(.spring()) {
                            proxyReader.scrollTo("Scroll_to_top", anchor: .top)
                        }
                    }, label: {
                        Image(systemName: "arrow.up")
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundColor(.white)
                            .padding()
                            .background(Color("custRed"))
                            .clipShape(Circle())
                            .shadow(color: Color.black.opacity(0.09), radius: 5, x: 5, y: 5)
                    })
                    .padding(.trailing)
//                    .padding(.bottom, getSafeArea().bottom == 0 ? 12 : 0)
                        .padding(.top, 250)
                    .opacity(-scrollViewOfset > 450 ? 1 : 0)
                    .animation(.easeInOut)
                    
                    , alignment: .trailing
                )
                .padding(.bottom, 60)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black)
        .environment(\.colorScheme, .dark)
    }
}

struct CatalogView_Previews: PreviewProvider {
    static var previews: some View {
        CatalogView(model: Product(id: "1",
                                   title: "Capuchino",
                                   imageUrl: "Capuchino",
                                   price: 1800,
                                   descript: "The is a large diversity in the world of coffee drinks so one may get confused when deciding what to order in a cafe."))
    }
}


extension View {
    func getSafeArea() -> UIEdgeInsets {
        return UIApplication.shared.windows.first?.safeAreaInsets ?? UIEdgeInsets(top: 0,
                                                                                  left: 0, bottom: 0, right: 0)
    }
}
