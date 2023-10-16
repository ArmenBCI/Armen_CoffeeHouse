//
//  LocationPeviewView.swift
//  CoffeeProject
//
//  Created by Yurka Babayan on 10.09.23.
//

import SwiftUI

struct LocationPeviewView: View {
    
    @EnvironmentObject private var vm: LocationViewModel
    @StateObject var viewMod: ProfileViewModel
    @State private var isShowDetailView: Bool = false
    
    let location: Location
    
    
    var body: some View {
        HStack(alignment: .bottom) {
            VStack(alignment: .leading, spacing: 16) {
                imageSection
                titleSection
            }
            
            
            VStack(spacing: 8) {
                learnModeButton
                nextButton
            }
        }
        .padding(20)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(.ultraThinMaterial)
                .offset(y: 70)
        )
        .cornerRadius(10)
        .animation(.easeOut)
    }
}

struct LocationPeviewView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.green
                .ignoresSafeArea()
            LocationPeviewView(viewMod: ProfileViewModel(profile: YBUser(id: "",
                                                                         name: "",
                                                                         phone: 0,
                                                                         adress: "")),
                               location: LocationDataService.location.first!)
            .padding(2)
        }
        .environmentObject(LocationViewModel())
    }
}


extension LocationPeviewView {
    
    private var imageSection: some View {
        ZStack {
            
            Image(location.imageNames)
                .resizable()
                .scaledToFill()
                .frame(width: 100, height: 100)
                .cornerRadius(10)
            
        }
        .padding(6)
        .background(Color.white)
        .cornerRadius(10)
        .animation(.easeInOut)
    }
    
    private var titleSection: some View {
        
        VStack(alignment: .leading, spacing: 4) {
            Text(location.name)
                .font(.title3)
                .fontWeight(.bold)
            
            if isShowDetailView {
                Text(location.time)
                    .font(.system(size: 17))
                    .animation(.easeInOut)
            }
            
            Text(location.cityName)
                .font(.subheadline)
        }
        .animation(.easeInOut)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var learnModeButton: some View {
        Button {
            isShowDetailView.toggle()
        } label: {
            Text("Ավելին")
                .foregroundColor(.white)
                .font(.headline)
                .frame(width: 125, height: 30)
        }
        .padding(9.5)
        .background(Color("custRed"))
        .cornerRadius(10)
        .animation(.easeInOut)
//        .sheet(isPresented: self.$isShowDetailView) {
//            LocationDetailView(location: location)
//        }
    }
    
    private var nextButton: some View {
        Button {
            // CHGITEM XI PETQA 2 TEXNEL GRES VOR MI ANGAMIC BUTTONY ASHXATI TECHE PETQA 2 ANGAM IRAR HETEVIC SXMES VOR ADRESSY POXI
            viewMod.profile.adress = location.name
            DataBaseService.shared.setProfile(user: viewMod.profile) { result in
                switch result {
                case .success(_):
                    viewMod.profile.adress = location.name
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        } label: {
            Text("ընտրել")
                .foregroundColor(Color("custRed"))
                .font(.headline)
                .frame(width: 125, height: 30)
        }
        .buttonStyle(.bordered)

        .onAppear {
            self.viewMod.getProfile()
            self.viewMod.getOrders()
        }
        //        .fullScreenCover(isPresented: self.$dismisCatalog) {
        //
        //        }
    }
}
