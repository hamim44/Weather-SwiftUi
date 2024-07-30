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
    func coodenateByCity(_ city: String) async throws -> Location {
        let (data, response) = try await URLSession.shared.data(from: ApiEndPoint.endpointsURl(for: .coordinantByGrographyclName(city)))
        guard let response = response as? HTTPURLResponse,
              response.statusCode == 200 else {
            throw NewworkError.invalidresponse
        }
        
        let locations = try! JSONDecoder().decode([Location].self, from: data)
        return locations.first!
    }
}
