//
//  ContentView.swift
//  Weather-swiftUi
//
//  Created by Abrar Hamim on 29/7/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Button("Get coodination"){
                Task {
                    let geocodingClient = GeoCodingLocation()
                    let weatherClient = WeatherClient()
               let location =  try await geocodingClient.coodenateByCity("paris")
                    let weather = try await weatherClient.fatchweather(location: location)
                    print(location)
                    print(weather)
                }
            }

        }
        .padding()
    }
}

#Preview {
    ContentView()
}
