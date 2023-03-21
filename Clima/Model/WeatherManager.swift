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

        performRequest(urlString)
    }

    func performRequest(_ urlString: String) {
        // create a url
        if let url = URL(string: urlString) {
            // create a url session
            let session = URLSession(configuration: .default)
            // give the session a task
            let task = session.dataTask(with: url, completionHandler: handle(data: response: error:))
            // start the task
            task.resume()
        }
    }

    func handle(data: Data?, response: URLResponse?, error: Error?) {
        if error != nil {
            print(error!)
            return
        }
        
        if let safeData = data {
            let dataString = String(data: safeData, encoding: .utf8)
            print(dataString!)
        }
    }
}
