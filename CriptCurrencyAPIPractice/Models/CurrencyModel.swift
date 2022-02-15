//
//  CurrencyModel.swift
//  CriptCurrencyAPIPractice
//
//  Created by Apple New on 2022-02-10.
//

import Foundation
import UIKit
struct CurrencyModel {
    var currencyIcon : UIImage?
    var fullCurrencyTitle : String
    var currencyTitle : String
    var previousRate : String
    var upToDateRate : String
}

struct Price: Codable{
    let name: String
    let unit: String
    let value: Float
    let type: String
}

struct Currency : Codable{
    let btc: Price
    let eth: Price
    let usd: Price
    let aud: Price
}

struct Rates: Codable{
    let rates: Currency
}
