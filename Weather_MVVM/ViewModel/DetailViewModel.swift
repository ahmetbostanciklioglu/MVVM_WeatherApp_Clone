//
//  DetailViewModel.swift
//  Weather_MVVM
//
//  Created by Ahmet Bostancıklıoğlu on 12.07.2022.
//

import Foundation
import Combine

class DetailViewModel: ObservableObject {
    
    @Published var weatherData = [Weather]()
    private let city: String
    private let weatherService: WeatherService
    private var bindings = Set<AnyCancellable>()
    
    init(city: String) {
        self.city = city
        self.weatherService = WeatherService(city: self.city)
    }
    
    func fetchWeather() {
        let handler: (Subscribers.Completion<Error>) -> Void = { _ in
            
        }
        
        let completionHandler: (Weather) -> Void = { value in
            self.weatherData = [value]
        }
        
        weatherService.fetchWeatherData()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: handler, receiveValue: completionHandler)
            .store(in: &bindings)
    }
    
}
