//
//  ContentView.swift
//  CoffeeProject
//
//  Created by Yurka Babayan on 16.08.23.
//

import SwiftUI

struct AuthView: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var passOn: Bool = true
    @State private var confPassOn: Bool = true
    @State private var isAuth: Bool = true
    @State private var isTabViewShow: Bool = false
    @State private var isShowAlert: Bool = false
    @State private var alertMessage: String = ""
    
//    @State private var isLoading: Bool = false
    
    var body: some View {
        VStack {
            VStack {
                Image("AuthViewCoffee")
                
                Text(isAuth ? "Sign in" : "Sign up")
                    .font(.title.bold())
                    .foregroundColor(.white)
                
                VStack {
                    
                    TextField("", text: self.$email, prompt: Text("Email").foregroundColor(.white))
                        .keyboardType(.emailAddress)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color("TextFieldGray"))
                        .cornerRadius(10)
                        .padding(.horizontal)
                        .padding(.top)
                    
                    HStack {
                        ZStack {
                            if passOn {
                                SecureField("", text: self.$password, prompt: Text("Password").foregroundColor(.white))
                                    .foregroundColor(.white)
                                    .padding(16)
                                    .background(Color("TextFieldGray"))
                                    .cornerRadius(10)
                                    .padding(.horizontal)
                                    .padding(.top, 13)
                            } else {
                                TextField("", text: self.$password, prompt: Text("Password").foregroundColor(.white))
                                    .foregroundColor(.white)
                                    .padding(16)
                                    .background(Color("TextFieldGray"))
                                    .cornerRadius(10)
                                    .padding(.horizontal)
                                    .padding(.top, 13)
                            }
                            Image(systemName: passOn ? "eye.slash.fill" : "eye.fill")
                                .foregroundColor(.white)
                                .padding(.top, 12)
                                .offset(x: 150)
                                .onTapGesture {
                                    passOn.toggle()
                                }
                        }
                    }
                    
                    if !isAuth {
                        HStack {
                            ZStack {
                                if confPassOn {
                                    SecureField("", text: self.$confirmPassword, prompt: Text("Confirm Password").foregroundColor(.white))
                                        .foregroundColor(.white)
                                        .padding(16)
                                        .background(Color("TextFieldGray"))
                                        .cornerRadius(10)
                                        .padding(.horizontal)
                                        .padding(.top, 13)
                                } else {
                                    TextField("", text: self.$confirmPassword, prompt: Text("Confirm Password").foregroundColor(.white))
                                        .foregroundColor(.white)
                                        .padding(16)
                                        .background(Color("TextFieldGray"))
                                        .cornerRadius(10)
                                        .padding(.horizontal)
                                        .padding(.top, 13)
                                }
                                Image(systemName: confPassOn ? "eye.slash.fill" : "eye.fill")
                                    .foregroundColor(.white)
                                    .padding(.top, 12)
                                    .offset(x: 150)
                                    .onTapGesture {
                                        confPassOn.toggle()
                                    }
                            }
                        }
                        .padding(.top, 10)
                    }
                    
//                    if isLoading {
//                        ProgressView()
//                            .progressViewStyle(CircularProgressViewStyle(tint: Color("custRed")))
//                            .scaleEffect(3)
//                    }
                    
                    //                    HStack {
                    //                        Button {
                    //                            //
                    //                        } label: {
                    //                            Text("Forgot your password?")
                    //                                .foregroundColor(.white)
                    //                        }
                    //                        Spacer()
                    //                    }
                    //                    .padding(.horizontal, 20)
                    //                    .padding(.top, 20)
                    
                    Button {
                        if isAuth {
//                            isLoading = true
                            AuthServise.shared.signIn(email: self.email,
                                                      password: self.password) { result in
                                switch result {
                                case .success(let user):
                                    isTabViewShow.toggle()
                                case .failure(let error):
                                    alertMessage = "Register error \(error.localizedDescription)!"
                                    isShowAlert.toggle()
                                }
                            }
                        } else {
                            guard password == confirmPassword else {
                                self.alertMessage = "Password mismatch!"
                                self.isShowAlert.toggle()
                                return
                            }
                            
                            AuthServise.shared.signUp(email: self.email,
                                                      password: self.password) { result in
                                switch result {
                                case .success(let user):
                                    
                                    alertMessage = "You registered with email \(user.email)"
                                    self.isShowAlert.toggle()
                                    self.email = ""
                                    self.password = ""
                                    self.confirmPassword = ""
                                    self.isAuth.toggle()
                                case .failure(let error):
                                    alertMessage = "Register error \(error.localizedDescription)!"
                                    self.isShowAlert.toggle()
                                }
                            }
                        }
                    } label: {
                        Text(isAuth ? "Sign in" : "Sign Up")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color("custRed"))
                            .cornerRadius(10)
                            .foregroundColor(.white)
                            .font(.title2.bold())
                            .padding(.horizontal, 20)
                            .padding(.top, 20)
                            .padding(.top)
                    }
                }
            }
            Spacer()
            
            HStack {
                Text(isAuth ? "Don’t have an account?" : "Sign in your accaunt")
                    .foregroundColor(isAuth ? .white : Color("custRed"))
                    .fontWeight(isAuth ? .regular : .bold)
                    .onTapGesture {
                        isAuth.toggle()
                    }
                Button {
                    isAuth.toggle()
                } label: {
                    Text(isAuth ? "Sign up" : "")
                        .fontWeight(.bold)
                        .foregroundColor(Color("custRed"))
                }
            }
            .alert(alertMessage, isPresented: self.$isShowAlert) {
                Button {
                    //
                } label: {
                    Text("OK")
                }
                
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .animation(Animation.easeInOut(duration: 0.2), value: isAuth)
        .fullScreenCover(isPresented: $isTabViewShow) {
            
            if AuthServise.shared.currentUser!.uid == "6HAl9SjLwARo4DUMN6YUAGkZdOc2" {
                AdminOrdersView()
            } else {
                let mainTabBarViewModel = MainTabBarViewModel(user: AuthServise.shared.currentUser!)
                MainTabBar(viewModel: mainTabBarViewModel)
            }
        }
        .background(Color(.black))
        .environment(\.colorScheme, .dark)
        
//        .onAppear { startNetworckCall() }
    }
    
//    func startNetworckCall() {
//        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
//            isLoading = false
//        }
//    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}
