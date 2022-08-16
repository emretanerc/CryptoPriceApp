//
//  MainTableViewController.swift
//  newsapp
//
//  Created by Emre Taner  Çetinkaya on 16.08.2022.
//

import UIKit
import Alamofire
import SwiftyJSON

class MainTableViewController: UITableViewController {

    var currency = [CurrencyModel]();
    
    override func viewDidLoad() {
        super.viewDidLoad()

        getLastData();
       
    }

   

    override func numberOfSections(in tableView: UITableView) -> Int {
       
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return currency.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainCell", for: indexPath) as! MainTableViewCell;


        // Configure the cell...
        
        cell.currencyBuying.text = currency[indexPath.row].price_usd + "$";
         cell.currencyRate.text = "";
      //  cell.currencyRate.text = currency[indexPath.row].name;
        cell.currencyCode.text = currency[indexPath.row].asset_id;
        
        return cell
    }
    
   
    func getLastData() {
        
        AF.request("https://rest.coinapi.io/v1/assets?apikey=97E74446-3DC3-4B97-A342-8271C060835A", method: .get).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value);
                print(response)
                for index in 0...json.count{
                
                    
                    let  price =   json[index]["price_usd"];
                      price.floatValue;
                    
                     
                    let newCurrency = CurrencyModel(asset_id: json[index]["asset_id"].stringValue, name: json[index]["name"].stringValue, price_usd: price.stringValue)
               
                    if price == nil {
                        // fiyat 0 ise listeye eklememesi için.
                        
                    } else {
                        self.currency.append(newCurrency);
                    }
                
                
                }
                self.tableView.reloadData();
            case .failure(let error):
                print(error)
            }
        }
    }
}
