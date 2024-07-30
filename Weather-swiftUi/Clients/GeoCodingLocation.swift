//
//  GeoCodingLocation.swift
//  Weather-swiftUi
//
//  Created by Abrar Hamim on 30/7/24.
//

import Foundation

enum NewworkError: Error {
    case invalidresponse
}



struct GeoCodingLocation {
    func callTheCityName(cityname: String) async throws ->Location {
        
        let (data,response) = try await URLSession.shared.data(from: ApiEndPoint.endpointsURl(for: .coordinantByGrographyclName("\(cityname)")))
        
        guard let response = response as? HTTPURLResponse,
              response.statusCode == 200 else {
            throw NewworkError.invalidresponse
        }
        
        let location = try! JSONDecoder().decode([Location].self, from: data)
        return location.first!
    }
}
