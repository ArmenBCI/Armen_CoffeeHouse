//
//  OrderStatus.swift
//  CoffeeProject
//
//  Created by Yurka Babayan on 28.08.23.
//

import Foundation

enum OrderStatus: String, CaseIterable {
    
    case new = "New"
    case coocing = "Getting Ready"
//    case delivery = "Delivered"
    case complete = "Complete"
    case canceled = "Canceled"
}
