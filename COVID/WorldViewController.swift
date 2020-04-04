//
//  WorldViewController.swift
//  COVID
//
//  Created by Himanshu Mehta on 2020-04-03.
//  Copyright © 2020 Himanshu Mehta. All rights reserved.
//

import Foundation
import UIKit

class WorldViewController :UITableViewController
{
   var cities: Array<String>!

   override func viewDidLoad()
   {
       cities = ["all"]

       self.tableView.reloadData()
   }

   override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
   {
       return cities?.count ?? 0
   }

   override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
   {
       let cell = tableView.dequeueReusableCell(withIdentifier: "WorldCell") as! WorldViewCell

       cell.setWorld(city: cities[indexPath.row])

       return cell
   }
    
    
    
    
}




