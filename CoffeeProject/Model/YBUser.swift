//
//  YBUser.swift
//  CoffeeProject
//
//  Created by Yurka Babayan on 24.08.23.
//

import Foundation

struct YBUser: Identifiable {
    
    var id: String 
    var name: String
    var phone: Int
    var adress: String
    
    var representation: [String: Any] {
        
        var repres = [String: Any]()
        repres["id"] = self.id
        repres["name"] = self.name
        repres["phone"] = self.phone
        repres["adress"] = self.adress
        
        return repres
    }
}
