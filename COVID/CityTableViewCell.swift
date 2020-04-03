//
//  CityTableViewCell.swift
//  COVID
//
//  Created by Himanshu Mehta on 2020-04-02.
//  Copyright © 2020 Himanshu Mehta. All rights reserved.
//

import Foundation
import UIKit

class CityTableViewCell : UITableViewCell
{
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var caseLabel: UILabel!
    @IBOutlet weak var recoverLabel: UILabel!
    @IBOutlet weak var deathLabel: UILabel!
    func setCity(city: String)
   
    {
            countryLabel.text = city
            if let weatherURL = WeatherURLManager.getCityWeatherURL(city: city) {
                let session = URLSession.shared
                let task = session.dataTask(with: weatherURL){(data, response, error)->Void in
                    if data != nil {
                        //Load temperature
                        let weatherData = JSON(data: data!)
                        print(weatherData)
                        let tempValue = weatherData["cases"].intValue
                        let recovered = weatherData["recovered"].intValue
                        let deaths = weatherData["deaths"].intValue
                        print(tempValue)
                        // load Icon
    //                    self.loadIcon(weatherData: weatherData)
                        DispatchQueue.main.async {
                            self.caseLabel.text = "\(tempValue)"
                            self.deathLabel.text = "\(deaths)"
                            self.recoverLabel.text = "\(recovered)"
                        }
                    }
                }
                task.resume()
            }
        }
        

      
        
        
    }
