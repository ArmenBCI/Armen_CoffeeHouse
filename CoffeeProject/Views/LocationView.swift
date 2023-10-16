//
//  LocationView.swift
//  CoffeeProject
//
//  Created by Yurka Babayan on 07.09.23.
//

import SwiftUI
import MapKit

struct LocationView: View {
    
    @EnvironmentObject private var vm: LocationViewModel
    
    var body: some View {
        ZStack {
            Map(coordinateRegion: self.$vm.mapRegion,
                annotationItems: vm.locations,
                annotationContent: { location in
                MapAnnotation(coordinate: location.cordinate) {
                    LocationmapAnotationView()
                        .scaleEffect(vm.mapLocation == location ? 1.05 : 0.7)
                        .shadow(radius: 15)
                        .onTapGesture {
                            vm.showNextLocation(location: location)
                        }
                }
            })
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                header
                    .padding()
                
                Spacer()
                
                ZStack {
                    ForEach(vm.locations) { location in
                        if vm.mapLocation == location {
                            LocationPeviewView(viewMod: ProfileViewModel(profile: YBUser(id: "",
                                                                                         name: "",
                                                                                         phone: 0,
                                                                                         adress: ""))
                                               , location: location)
                                .shadow(color: Color.black.opacity(0.3), radius:  20)
                                .padding(.horizontal)
                                .transition(.asymmetric(insertion: .move(edge: .trailing),
                                                        removal: .move(edge: .leading)))
                        }
                    }
                }
                .padding(.bottom, 65)
            }
        }
    }
}


struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView()
            .environmentObject(LocationViewModel())
            .environment(\.colorScheme, .dark)
    }
}


extension LocationView {
    
    private var header: some View {
        VStack {
            Button {
                vm.toggleLocationList()
            } label: {
                Text(vm.mapLocation.name)
                    .font(.title3)
                    .fontWeight(.black)
                    .foregroundColor(.primary)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .animation(.none, value: vm.mapLocation)
                    .overlay(alignment: .leading) {
                        Image(systemName: "arrow.down")
                            .font(.headline)
                            .foregroundColor(.primary)
                            .padding(8)
                            .rotationEffect(Angle(degrees: vm.showLocationsList ? 180 : 0))
                    }
            }

            if vm.showLocationsList {
                LocationsListView()
            }
        }
        .background(.thinMaterial)
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 15)
    }
}
