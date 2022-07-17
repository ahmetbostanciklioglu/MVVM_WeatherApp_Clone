//
//  MainViewModel.swift
//  Weather_MVVM
//
//  Created by Ahmet Bostancıklıoğlu on 12.07.2022.
//

import Foundation
import Combine

class MainViewModel: ObservableObject {
    
    @Published var cityNames: [String]  = []
    let cityList = ["Tokyo", "Chicago", "Delhi", "Paris",               "Zurich",
                    "Berlin", "Moscow", "New York", "London", "Miami",
                    "Gaziantep", "Moscova", "Amsterdam", "San Fransisco",
                    "Ankara", "İstanbul"
                    ]
    
    init() {
        getList()
    }
    
    func getList() {
        self.cityNames = cityList
    }
}
