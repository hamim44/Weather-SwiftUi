//
//  WeatherClient.swift
//  Weather-swiftUi
//
//  Created by Abrar Hamim on 30/7/24.
//

import Foundation

struct WeatherClient {
    
    func fatchweather(location: Location)  async throws -> Weather {
        let (data,response) = try await URLSession.shared.data(from: ApiEndPoint.endpointsURl(for: .weatherByLatLon(location.lat, location.lon)))
        
        guard let response = response as? HTTPURLResponse,
              response.statusCode == 200 else {
            throw NewworkError.invalidresponse
        }
        
        let weatherResponse = try JSONDecoder().decode(WeatherResponse.self, from: data)
        return weatherResponse.main
        
    }

}
