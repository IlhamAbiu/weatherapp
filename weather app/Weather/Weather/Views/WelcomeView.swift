//
//  WelcomeView.swift
//  Weather
//
//  Created by Ilgam Khasanov on 16.01.2023.
//

import SwiftUI
import CoreLocationUI

struct WelcomeView: View {
    @EnvironmentObject var locationManager:
        LocationManager
    
    var body: some View {
        VStack{
            VStack(spacing:20){
                Text("Welcome to the Weather App").bold()
                    .font(.title)
                Text("Please share your location to get the weather in your area ").padding()
            }
            .multilineTextAlignment(.center)
            .padding()
            
            
            LocationButton(.shareCurrentLocation){
                locationManager.requestLocation()
            }
            .background(Color(.black))
            .cornerRadius(30)
            .symbolVariant(.fill)
            .foregroundColor(.white)
        
            
        }
        .frame( maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
