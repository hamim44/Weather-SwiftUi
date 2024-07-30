//
//  ContentView.swift
//  Weather-swiftUi
//
//  Created by Abrar Hamim on 29/7/24.
//

import SwiftUI

struct ContentView: View {
    @State var city:String = ""
    @ State var isfatchdataweather: Bool = false
   
    let geocodingClient = GeoCodingLocation()
    let weatherClient = WeatherClient()
    @State var weather: Weather?
    
    func fatchweather() async {
        do {
             let weatherdata = try await geocodingClient.callTheCityName(cityname: city)
          weather =  try await  weatherClient.fatchWeather(location: weatherdata)
            
        } catch {
            print(error)
        }
       
    }
    
    var body: some View {
        VStack {
            TextField("City Name", text: $city)
                .onSubmit {
                    isfatchdataweather = true
                }.task(id: isfatchdataweather ) {
                    if isfatchdataweather {
                        await fatchweather()
                        isfatchdataweather = false
                        city = ""
                    }
                }
            Spacer()
            
            if let weather {
                Text("\(weather.temp.formatted()) C")
                    .font(.system(size: 100))
            }
            Spacer()
            
            
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
