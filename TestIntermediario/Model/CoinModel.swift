//
//  CoinModel.swift
//  TestIntermediario
//
//  Created by user208023 on 6/3/22.
//

import Foundation

struct Coins: Codable {
    var rates: [Rates]
}

struct Rates: Codable {
    var asset_id_quote: String
    var rate: Double
}
