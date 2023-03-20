//
//  WeatherManager.swift
//  Clima
//
//  Created by Jeric Hernandez on 3/21/23.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import Foundation

struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?APPID=d6f9480dda4303efae51f41bec734474&units=metric"
    
    func fetchWeather(_ cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        
        print(urlString)
    }
    
    func performRequest(_ urlString: String) {
        // create a url
        // create a url session
        // give the session a task
        // start the task
    }
}
