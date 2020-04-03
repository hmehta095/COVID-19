//
//  CityTableViewController.swift
//  COVID
//
//  Created by Himanshu Mehta on 2020-04-02.
//  Copyright © 2020 Himanshu Mehta. All rights reserved.
//

import Foundation
import UIKit

class CityTableViewController: UITableViewController,UISearchBarDelegate
{
    @IBOutlet weak var searchView: UISearchBar!
     var cities: [String] = ["Canada","USA","India","Pakistan" ,"Italy", "Spain", "China","Iran","France","UK","Switzerland","Turkey","Belgium",
        "Netherlands","Austria","S. Korea","Portugal","Brazil","Israel","Australia","Russia","Malaysia","Chile",
        "Denmark","Ireland","Czechia","Norway","Sweden","Serbia","Colombia","Argentina","Iceland","Dominican Republic","Panama","Peru","Mexico","South Africa","Greece","Finland","Indonesia","Saudi Arabia","Thailand","Philippines","Luxembourg","Japan","Romania",
        "Poland","Ecuador","Lebanon","Hungary","Bahrain","Armenia","Lithuania","Morocco","Diamond Princess","Iraq","Hong Kong","Estonia","Egypt","Ukraine","New Zealand","UAE","Qatar","Slovenia","Algeria","Croatia","Singapore","Bosnia and Herzegovina","Cameroon","San Marino","Afghanistan","Albania","Jordan","Réunion","Burkina Faso","Kuwait","Cyprus","Taiwan","Uruguay","North Macedonia","Azerbaijan","Costa Rica","Andorra","Slovakia","Kazakhstan","Bulgaria","Moldova","Tunisia","Latvia","Mauritius","Belarus","Channel Islands","Faeroe Islands","Nigeria","Uzbekistan","Malta","Senegal","Ivory Coast","Ghana","Oman","Cuba","Honduras","Vietnam","Rwanda","Trinidad and Tobago","Mayotte","DRC","Cambodia","Bolivia","Kyrgyzstan","Georgia","Montenegro","Guadeloupe","Brunei","Palestine","Martinique","Venezuela","Sri Lanka","Mali","Bermuda","Djibouti","Zambia","Togo","French Polynesia","Macao","El Salvador","Uganda","Jamaica","Barbados","Guatemala","French Guiana","Bangladesh","Aruba","Monaco","Madagascar","Isle of Man","Liechtenstein","Niger","Paraguay","Gibraltar","Kenya","Guinea-Bissau","MS Zaandam","Suriname","Seychelles","Mozambique","Libya","Laos","Grenada","Greenland","Syria","Curaçao","Dominica","Saint Lucia","Benin","Namibia","Mongolia","Eritrea","Equatorial Guinea","New Caledonia","Haiti","Sint Maarten","Myanmar","Gabon","Maldives","Guyana","Tanzania","Bahamas","Saint Martin","Cayman Islands","Congo","Ethiopia","Guinea","Eswatini","Angola","Zimbabwe","Saint Kitts and Nevis","Sudan","Antigua and Barbuda","Chad","Fiji","Cabo Verde","Mauritania","Vatican City","Liberia","St. Barth","Turks and Caicos","Nicaragua","Nepal","Bhutan","Montserrat","Somalia","Botswana","Gambia","Belize","British Virgin Islands","CAR","Anguilla","Burundi","Caribbean Netherlands","St. Vincent Grenadines","Sierra Leone","Papua New Guinea","Timor-Leste","Timor-Leste" ]
        
        var filterdata:[String]!
        
        override func viewDidLoad()
        {
            
            
            
            super.viewDidLoad()
            tableView.dataSource = self
            searchView.delegate = self
            filterdata = cities
            
            self.addDoneButtonOnKeyboard()

    //        self.tableView.reloadData()
        }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
        {
            return filterdata.count
        }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CityCell", for: indexPath)as! CityTableViewCell

            
            if filterdata.count != 0
                   {
    //                   cell.textview.text = filterdata[indexPath.row]
                    cell.setCity(city: filterdata[indexPath.row])
                   }
                   else{
                cell.setCity(city: cities[indexPath.row])
    //                   cell.textview.text = data[indexPath.row]
                   }
            

            return cell
            
            
            
            
            
            
            
            
        }
        
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {

                // filterdata  = searchText.isEmpty ? data : data.filter {(item : String) -> Bool in

                filterdata = searchText.isEmpty ? cities : cities.filter { $0.contains(searchText) }

                //return item.range(of: searchText, options: .caseInsensitive, range: nil, locale: nil) != nil

            tableView.reloadData()
        }
        
        
        
        func addDoneButtonOnKeyboard(){
            let doneToolbar: UIToolbar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
            doneToolbar.barStyle = .default

            let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
            let done: UIBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(self.doneButtonAction))

            let items = [flexSpace, done]
            doneToolbar.items = items
            doneToolbar.sizeToFit()

            searchView.inputAccessoryView = doneToolbar
        }

        @objc func doneButtonAction(){
            searchView.resignFirstResponder()
        }
     
        
        
       
        
        
    }
