//
//  ApiendPoint.swift
//  Weather-swiftUi
//
//  Created by Abrar Hamim on 29/7/24.
//

import Foundation

enum ApiEndPoint {
    
    static let baseURL = "https://api.openweathermap.org"
    
    case coordinantByGrographyclName(String)
    case weatherByLatLon(Double,Double)
    
     var path : String {
         switch self {
        case .coordinantByGrographyclName(let city):
            return "/geo/1.0/direct?q=\(city)&appid=\(Constant.keys.weatherAPIkey)"
        case .weatherByLatLon(let lat, let lon):
             return "/data/2.5/weather?lat=\(lat)&lon=\(lon)&appid=\(Constant.keys.weatherAPIkey)"
        }
    }
    
    static func endpointsURl(for endpoint: ApiEndPoint)-> URL {
        let endpointpath = endpoint.path
        return URL(string: baseURL + endpointpath)!
    }
    
}


