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
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)

            let task = session.dataTask(with: url) { data, _, error in
                if error != nil {
                    print(error!)
                    return
                }

                if let safeData = data {
                    parseJSON(weatherData: safeData)
                }
            }
            task.resume()
        }
    }

    func parseJSON(weatherData: Data) {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let name = decodedData.name

            let weather = WeatherModel(conditionId: id, cityName: name, temperature: temp)

            let condition = weather.conditionName
            print(condition)
            let tempString = weather.temperatureString
            print(tempString)

        } catch {
            print("ERROR IS \(error)")
        }
    }
}
