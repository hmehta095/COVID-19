//
//  WorldViewCell.swift
//  COVID
//
//  Created by Himanshu Mehta on 2020-04-04.
//  Copyright © 2020 Himanshu Mehta. All rights reserved.
//

import Foundation
import UIKit

class WorldViewCell : UITableViewCell
{
    @IBOutlet weak var worldCasesLabel: UILabel!
    @IBOutlet weak var worldDeathsLabel: UILabel!
    @IBOutlet weak var worldRecoveredLabel: UILabel!
    func setWorld(city: String)
      
       {
               
               if let weatherURL = WeatherURLManager.getWorldCoronaURL(city: city) {
                   let session = URLSession.shared
                   let task = session.dataTask(with: weatherURL){(data, response, error)->Void in
                       if data != nil {
                           //Load temperature
                           let CoronaData = JSON(data: data!)
                           print(CoronaData)
                           let worldCases = CoronaData["cases"].intValue
                           let worldRecovered = CoronaData["recovered"].intValue
                           let worldDeaths = CoronaData["deaths"].intValue
                           
                           // load Icon
       //                    self.loadIcon(weatherData: weatherData)
                           DispatchQueue.main.async {
                               self.worldCasesLabel.text = "\(worldCases)"
                               self.worldDeathsLabel.text = "\(worldRecovered)"
                               self.worldRecoveredLabel.text = "\(worldDeaths)"
                           }
                       }
                   }
                   task.resume()
               }
           }
    
    
    
    @IBAction func covidGuideButton(sender: AnyObject) {

    if let url = NSURL(string: "https://www.who.int/emergencies/diseases/novel-coronavirus-2019/advice-for-public") {

        UIApplication.shared.open(url as URL, options:[:], completionHandler:nil)

        }
    }
}
