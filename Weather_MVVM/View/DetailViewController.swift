//
//  DetailViewController.swift
//  Weather_MVVM
//
//  Created by Ahmet Bostancıklıoğlu on 12.07.2022.
//

import UIKit
import Combine

class DetailViewController: UIViewController {

    let city: String
    let detailView = DetailView()
    let detailViewModel: DetailViewModel
    private var bindings = Set<AnyCancellable>()
    
    
    init(city: String) {
        self.city = city
        detailViewModel = DetailViewModel(city: city)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        view = detailView
        title = "Today's Weather"
        bindViewModelToView()
        detailViewModel.fetchWeather()
    }

    func bindViewModelToView() {
        detailViewModel.$weatherData
            .receive(on: RunLoop.main)
            .sink { (val) in
                guard let temperature = val.first?.main.temp,
                      let minTemperature = val.first?.main.tempMin,
                      let maxTemperature = val.first?.main.tempMax,
                      let humidity = val.first?.main.humidity,
                      let pressure = val.first?.main.pressure,
                      let windSpeed = val.first?.wind.speed,
                      let visibility = val.first?.visibility else {
                        return
                }
                  
                self.detailView.tempLabel.text = String(temperature) + "\u{00B0}" + "C"
                self.detailView.minTempLabel.text = String(minTemperature) + "\u{00B0}" + "C"
                self.detailView.maxTempLabel.text = String(maxTemperature)  + "\u{00B0}" + "C"
                self.detailView.humidityLabel.text = String(humidity) + "%"
                self.detailView.pressureLabel.text = String(pressure)  + " hPa"
                self.detailView.windLabel.text = String(windSpeed) + " Km/h"
                self.detailView.visibilityLabel.text = String(visibility / 1000) + " Km"
            }
        
            .store(in: &bindings)
    }
   

}
