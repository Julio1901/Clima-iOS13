//
//  WeatherManager.swift
//  Clima
//
//  Created by Julio Cesar  on 28/07/22.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation

protocol WheatherManagerDelegate {
    func didUpdateWeather(wheather: WeatherModel)
    func didFailWithError(error: Error)
    
}




struct WeatherManager {
    let wheaterURL = "https://api.openweathermap.org/data/2.5/weather?appid=1838a1cab2e964b6cec1eb93fce62d28&units=metric"
    
    var delegate: WheatherManagerDelegate?
    
    func fetchWeather(cityName: String) {
        let urlString = "\(wheaterURL)&q=\(cityName)"
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String){
        //Create a URL
        if let url = URL(string: urlString){
            
            //Create a URLSession
            let session = URLSession(configuration: .default)
            
            //Give the session a task
            
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    delegate?.didFailWithError(error: error!)
                    return
                }
                
                if let safeData = data{
                    if let weather = self.parseJSON(weatherData: safeData) {
                        delegate?.didUpdateWeather(wheather: weather)
                    }
                }
            }
            
            //Start the task
            
            task.resume()
            
        }
        
    }
    
    func parseJSON(weatherData: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
       
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let name = decodedData.name
            
            let wheater = WeatherModel(conditionId: id, cityName: name, temperature: temp)
            return wheater
            
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
    
    

    
}
