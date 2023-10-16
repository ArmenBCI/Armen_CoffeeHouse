//
//  LocationsListView.swift
//  CoffeeProject
//
//  Created by Yurka Babayan on 07.09.23.
//

import SwiftUI

struct LocationsListView: View {
    
    @EnvironmentObject private var vm: LocationViewModel
    
    var body: some View {
        List {
            ForEach(vm.locations) { locations in
                Button {
                    vm.showNextLocation(location: locations)
                } label: {
                    listRowView(locations: locations)
                }
                .padding(.vertical, 4)
                .listRowBackground(Color.clear)
            }
        }
        .listStyle(PlainListStyle())
        .padding(.bottom, 25)
    }
}

struct LocationsListView_Previews: PreviewProvider {
    static var previews: some View {
        LocationsListView()
            .environmentObject(LocationViewModel())
    }
}


extension LocationsListView {
    
    private func listRowView(locations: Location) -> some View {
        
        HStack {
            Image(locations.imageNames)
                .resizable()
            //                        .scaledToFit()
                .frame(width: 50, height: 50)
                .cornerRadius(15)
            
            VStack(alignment: .leading) {
                Text(locations.name)
                    .font(.headline)
                Text(locations.cityName)
                    .font(.subheadline)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}
