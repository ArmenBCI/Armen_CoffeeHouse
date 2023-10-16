//
//  LocationmapAnotationView.swift
//  CoffeeProject
//
//  Created by Yurka Babayan on 12.09.23.
//

import SwiftUI

struct LocationmapAnotationView: View {
    
    let accentColor = Color("custRed")
    
    var body: some View {
        VStack(spacing: 0) {
            Image(systemName: "cup.and.saucer.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
                .font(.headline)
                .foregroundColor(.white)
                .padding(6)
                .background(accentColor)
                .cornerRadius(36)
            
            Image(systemName: "triangle.fill")
                .resizable()
                .scaledToFit()
                .foregroundColor(accentColor)
                .frame(width: 10, height: 10)
                .rotationEffect(Angle(degrees: 180))
                .offset(y: -3)
                .padding(.bottom, 40)
        }
    }
}

struct LocationmapAnotationView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            LocationmapAnotationView()
        }
    }
}
