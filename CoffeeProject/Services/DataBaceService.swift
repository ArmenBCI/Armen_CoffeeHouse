//
//  DataBaceService.swift
//  CoffeeProject
//
//  Created by Yurka Babayan on 24.08.23.
//

import Foundation
import FirebaseFirestore


class DataBaseService {
    
    static let shared = DataBaseService()
    private let db = Firestore.firestore()
    
    private var usersRef: CollectionReference {
        return db.collection("users")
    }
    
    private var orderRef: CollectionReference {
        return db.collection("orders")
    }
    
    private init() { }
    
    func getPossitions(by orderID: String, completion: @escaping (Result<[Possition], Error>) -> ()) {
        
        let positionsRef = orderRef.document(orderID).collection("positions")
        
        positionsRef.getDocuments { qSnap, error in
            if let querySnapshot = qSnap {
                var positions = [Possition]()
                
                for doc in querySnapshot.documents {
                    if let position = Possition(doc: doc) {
                        positions.append(position)
                    }
                }
                completion(.success(positions))
            } else if let error = error {
                completion(.failure(error))
            }
        }
        
    }
    
    func getOrders(by userID: String?, completion: @escaping (Result<[Order], Error>) -> ()) {
        
        self.orderRef.getDocuments { qSnap, error in
            
            if let qSnap = qSnap {
                var orders = [Order]()
                for doc in qSnap.documents {
                    if let userID = userID {
                        if let order = Order(doc: doc), order.userID == userID {
                            orders.append(order)
                        }
                    } else { // ADMINI CHYUX
                        if let order = Order(doc: doc){
                            orders.append(order)
                        }
                    }
                }
                completion(.success(orders))
            } else if let error = error {
                completion(.failure(error))
            }
        }
    }
    
    
    
    func setOrder(order: Order, completion: @escaping (Result<Order, Error>) -> ()) {
        orderRef.document(order.id).setData(order.representation) { error in
            if let error = error {
                completion(.failure(error))
            } else {
                self.setPositions(to: order.id, positions: order.positions) { result in
                    switch result {
                    case .success(let positions):
                        print(positions.count)
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                }
                completion(.success(order))
            }
        }
    }
    
    func setPositions(to orderId: String,
                     positions: [Possition],
                     completion: @escaping (Result<[Possition], Error>) -> ()) {
        
        let positionRef = orderRef.document(orderId).collection("positions")
        
        for position in positions {
            positionRef.document(position.id).setData(position.representation)
        }
        
        completion(.success(positions))
    }
    
    
    
    func setProfile(user: YBUser, completion: @escaping (Result<YBUser, Error>) -> ()) {
        
        usersRef.document(user.id).setData(user.representation) { error in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(user))
            }
        }
    }
    
    func getProfile(by UserId: String? = nil, compleition: @escaping (Result<YBUser, Error>) -> ()) {
        
        usersRef.document(UserId != nil ? UserId! : AuthServise.shared.currentUser!.uid).getDocument { docSnapshot, error in
            
            guard let snap = docSnapshot else { return }
            guard let data = snap.data() else { return }
            guard let userName = data["name"] as? String else { return }
            guard let id = data["id"] as? String else { return }
            guard let phone = data["phone"] as? Int else { return }
            guard let address = data["adress"] as? String else { return }
            
            let user = YBUser(id: id, name: userName, phone: phone, adress: address)
            
            compleition(.success(user))
        }
        
    }
    
    
}
