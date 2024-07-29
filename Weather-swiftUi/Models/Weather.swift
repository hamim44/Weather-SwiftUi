//
//  Weather.swift
//  Weather-swiftUi
//
//  Created by Abrar Hamim on 29/7/24.
//

import Foundation

struct WeatherResponse: Decodable {
    let main: Weather
}
struct Weather: Decodable {
    let temp: Double
}
