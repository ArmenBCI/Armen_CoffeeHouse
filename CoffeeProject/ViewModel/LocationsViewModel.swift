//
//  LocationsViewModel.swift
//  CoffeeProject
//
//  Created by Yurka Babayan on 07.09.23.
//

import Foundation
import MapKit
import SwiftUI

class LocationViewModel: ObservableObject {
    
    
    // ALL LOADED LOCATIONS
    @Published var locations: [Location]
    
    // Current locations on map
    @Published var mapLocation: Location {
        didSet {
            updateMapRegion(location: mapLocation)
        }
    }

    // Current region on map
    @Published var mapRegion: MKCoordinateRegion = MKCoordinateRegion()
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    
    // Show list of lpcations
    
    @Published var showLocationsList: Bool = false
    
    
    init() {
        let locations = LocationDataService.location
        self.locations = locations
        self.mapLocation = locations.first!
        self.updateMapRegion(location: locations.first!)
    }
    
    
    private func updateMapRegion(location: Location) {
        withAnimation(.easeInOut) {
            mapRegion = MKCoordinateRegion(
                center: location.cordinate,
                span: mapSpan)
        }
    }
    
     func toggleLocationList() {
        withAnimation(.easeOut) {
            showLocationsList.toggle()
        }
    }
    
    func showNextLocation(location: Location) {
        withAnimation(.easeOut) {
            mapLocation = location
            showLocationsList =  false 
        }
    }
    
//    func nextButtonPressed() {
//        
//        guard let currentIndex = locations.firstIndex(where: { $0 == mapLocation }) else {
//            print("Cloud not find current index in locations array!")
//            return
//        }
//        
//        let nextIndex = currentIndex + 1
//        guard locations.indices.contains(nextIndex) else {
//            guard let firstLocation = locations.first else { return }
//            showNextLocation(location: firstLocation)
//            return
//        }
//        let nextLocation = locations[nextIndex]
//        showNextLocation(location: nextLocation)
//    }
} 
