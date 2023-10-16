//
//  AuthService.swift
//  CoffeeProject
//
//  Created by Yurka Babayan on 24.08.23.
//

import Foundation
import FirebaseAuth

class AuthServise {
    
    static let shared = AuthServise()
    
    private init() { }
    
    private let auth = Auth.auth()
    
    var currentUser: User? {
        return auth.currentUser
    }
    
    func signOut() {
        try! auth.signOut()
    }
    
    func signUp(email: String,
                password: String,
                complition: @escaping (Result<User, Error>) -> ()) {
        
        auth.createUser(withEmail: email,
                        password: password) { result, error in
            
            if let result = result {
                let ybUser = YBUser(id: result.user.uid,
                                    name: "",
                                    phone: 0,
                                    adress: "")
                
                DataBaseService.shared.setProfile(user: ybUser) { resultDB in
                    switch resultDB {
                    case .success(_):
                        complition(.success(result.user))
                    case .failure(let error):
                        complition(.failure(error))
                    }
                }
            } else if let error = error {
                complition(.failure(error))
            }
        }
    }
    
    
    
    
    func signIn(email: String,
                password: String,
                complition: @escaping (Result<User, Error>) -> ()) {
        
        auth.signIn(withEmail: email, password: password) { result, error in
            
            if let result = result {
                complition(.success(result.user))
            } else if let error {
                complition(.failure(error))
            }
        }
    }
    
    
}


