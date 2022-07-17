//
//  WeatherService.swift
//  Weather_MVVM
//
//  Created by Ahmet Bostancıklıoğlu on 12.07.2022.
//

import Foundation
import Combine

class WeatherService {
    
    let city: String
    let unit = "metric"
    let apiKey = "cb9460bd4572175d0b37df1e3bdc78d7"
    let baseUrl = "http://api.openweathermap.org/data/2.5/weather?"
    
    init(city: String) {
        self.city = city
    }
    
    func fetchWeatherData() -> AnyPublisher<Weather, Error> {
        // Service call
        let query: String = "q=\(city)&units=\(unit)&appid=\(apiKey)"
        let requestUrl = URL(string: baseUrl + query)
        
        var fetchDataTask: URLSessionDataTask?
        
        return Future<Weather, Error> { promise in
            fetchDataTask = URLSession.shared.dataTask(with: requestUrl!, completionHandler: { (data, response, error) in
               
                guard let data = data else {
                    return
                }
                
                do {
                    let players = try JSONDecoder().decode(Weather.self, from: data)
                    promise(.success(players))
                } catch {
                    print(error.localizedDescription)
                }
            })
            fetchDataTask?.resume()
        }
        .receive(on: DispatchQueue.main)
        .eraseToAnyPublisher()
    }
}

