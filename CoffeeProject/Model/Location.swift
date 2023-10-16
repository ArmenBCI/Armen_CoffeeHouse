//
//  Location.swift
//  CoffeeProject
//
//  Created by Yurka Babayan on 07.09.23.
//

import Foundation
import MapKit

struct Location: Identifiable, Equatable {

    let name: String
    let cityName: String
    let cordinate: CLLocationCoordinate2D
    let description: String
    let imageNames: String
    let time: String
    
    var id: String {
        name + cityName
    }
    
    static func == (lhs: Location, rhs: Location) -> Bool {
        lhs.id == rhs.id
    }
}
