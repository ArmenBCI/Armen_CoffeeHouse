//
//  LocationDetailView.swift
//  CoffeeProject
//
//  Created by Yurka Babayan on 13.09.23.
//

import SwiftUI

struct LocationDetailView: View {
    
    let location: Location
    
    var body: some View {
        VStack {
            
            VStack {
                Spacer()
                HStack {
                    Image(location.imageNames)
                        .cornerRadius(20)
                        .scaledToFill()
                    
                    VStack(alignment: .leading) {
                        Text(location.description)
                            .font(.system(size: 20).bold())
                            .padding(.vertical)
                        Text(location.time)
                            .font(.title3)
                    }
                    .padding(.bottom, 100)
                    
                    Spacer()
                }
                .padding()
                .background(Color.gray.opacity(0.5))
                .cornerRadius(20)
                .padding(.horizontal, 5)
                Spacer()
            }
        }
        .ignoresSafeArea()
    }
}

struct LocationDetailView_Previews: PreviewProvider {
    static var previews: some View {
        LocationDetailView(location: LocationDataService.location.first!)
    }
}
