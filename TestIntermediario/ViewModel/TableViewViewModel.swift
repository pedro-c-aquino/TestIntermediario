//
//  TableViewViewModel.swift
//  TestIntermediario
//
//  Created by user208023 on 6/3/22.
//

import UIKit
import Alamofire

class TableViewViewModel {
    var coinArray: [String] = ["BTC", "ETH", "USDT", "XRP", "ADA", "DOGE", "LTC", "DASH"]
    var ratesArray: [Rates] = []
    let usd = "USD"
    
    let baseURL = "https://rest.coinapi.io/v1/"
    let apiKey = "7461CC62-EFA7-4B5B-A3D8-53E705C1BB7D"
    
    func getCount() -> Int {
        return self.ratesArray.count
    }
    
    func getLabel(indexPath: IndexPath) -> String {
        return coinArray[indexPath.row]
    }
    
    func getRate(indexPath: IndexPath) -> Rates {
        return ratesArray[indexPath.row]
    }
    
    func networkCoins(completion: @escaping (Bool, Error?) -> Void) {
        let url = "\(baseURL)exchangerate/\(usd)?invert=true&apikey=\(apiKey)"
        
        AF.request(url).responseJSON { response in
            if let data = response.data {
                do {
                    let result: Coins = try JSONDecoder().decode(Coins.self, from: data)
                    for coin in self.coinArray {
                        let selectedCoin = result.rates.filter {$0.asset_id_quote == coin}
                        self.ratesArray.append(selectedCoin[0])
                    }
                    
                    print(self.ratesArray)
                    completion(true, nil)
                } catch  {
                    completion(false, error)
                }
            }
        }
    }
    
}

