//
//  WeatherData.swift
//  Clima
//
//  Created by Julio Cesar  on 01/08/22.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation


struct WeatherData: Codable {
    let name: String
    let main: Main
    let weather: [Weather]
}

struct Main: Codable {
    let temp: Double
}

struct Weather: Codable{
    let id: Int
    let description: String
}
