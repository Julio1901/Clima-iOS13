//
//  WeatherModel.swift
//  Clima
//
//  Created by Julio Cesar  on 13/08/22.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation

struct WeatherModel {

    let conditionId: Int
    let cityName: String
    let temperature: Double
    
    //Computer property
    var temperatureString: String {
        return String(format: "%.1f", temperature)
    }
    
    //Computer property
    var conditionName: String {
        switch conditionId {
        case 200...232:
            return "cloud.boult"
        case 300...321:
            return "cloud.drizzle"
        case 500...531:
            return "cloud.rain"
        case 600...622:
            return "cloud.snow"
        case 701...781:
            return "cloud.fog"
        case 800:
            return "sun.max"
        case 801...804:
            return "cloud.bolt"
        default:
            return "cloud"
        }
    }
        
    
        //Old way
    
//    func getConditionName(weatherId: Int) -> String {
//        switch weatherId {
//        case 200...232:
//            return "cloud.boult"
//        case 300...321:
//            return "cloud.drizzle"
//        case 500...531:
//            return "cloud.rain"
//        case 600...622:
//            return "cloud.snow"
//        case 701...781:
//            return "cloud.fog"
//        case 800:
//            return "sun.max"
//        case 801...804:
//            return "cloud.bolt"
//        default:
//            return "cloud"
//        }
//    }
    
}
