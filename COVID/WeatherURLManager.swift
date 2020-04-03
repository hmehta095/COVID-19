//
//  WeatherURLManager.swift
//  COVID
//
//  Created by Himanshu Mehta on 2020-04-02.
//  Copyright © 2020 Himanshu Mehta. All rights reserved.
//

import Foundation

class WeatherURLManager
{
    class func getCityWeatherURL(city: String) -> URL?
    {
        let urlString = "https://coronavirus-19-api.herokuapp.com/countries/\(city)"

        return URL(string: urlString)
    }
}
