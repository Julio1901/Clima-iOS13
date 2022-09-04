//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {
   
    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var shearchTextField: UITextField!
    @IBOutlet weak var cityLabel: UILabel!
    
    var weatherManager = WeatherManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        weatherManager.delegate = self
        shearchTextField.delegate = self
    }
    
    
    
}


//MARK: - UiTextFieldDelegate
extension WeatherViewController: UITextFieldDelegate{
    
    @IBAction func searchPressed(_ sender: UIButton) {
        
        if let text = shearchTextField.text {
            shearchTextField.endEditing(true)
        } else {
            print("empy")
        }
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        shearchTextField.endEditing(true)
        if let text = shearchTextField.text {
        } else {
            print("empy")
        }
        return true
    }
    
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        } else {
            textField.placeholder = "Type something"
            return false
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let city = shearchTextField.text {
            weatherManager.fetchWeather(cityName: city)
        }
        
        shearchTextField.text = ""
    }
    
}


//MARK: - WheatherManagerDelegate
extension WeatherViewController: WheatherManagerDelegate {
    
    func didUpdateWeather(wheather: WeatherModel){
        DispatchQueue.main.async {
            self.temperatureLabel.text = wheather.temperatureString
            self.cityLabel.text = wheather.cityName
            self.conditionImageView.image = UIImage(systemName: wheather.conditionName)
        }
        
    }
    
    
    func didFailWithError(error: Error) {
        
        print(error)
    }
}
