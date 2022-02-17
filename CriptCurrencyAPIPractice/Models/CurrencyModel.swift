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
//    let usd: Price
//    let aud: Price

    //A
    let aed: Price
    let ars: Price
    let aud: Price
    //B
    let bdt: Price
    let bhd: Price
    let bmd: Price
    let brl: Price
    //C
    let cad: Price
    let chf: Price
    let clp: Price
    let cny: Price
    let czk: Price
    //D
    let dkk: Price
    //E
    let eur: Price
    //G
    let gbp: Price
    //H
    let hkd: Price
    let huf: Price
    //I
    let idr: Price
    let ils: Price
    let inr: Price
    //J
    let jpy: Price
    //K
    let krw: Price
    //I
    let lkr: Price
    //M
    let mmk: Price
    let mxn: Price
    let myr: Price
    //N
    let ngn: Price
    let nok: Price
    let nzd: Price
    //P
    let php: Price
    let pkr: Price
    let pln: Price
    //R
    let rub: Price
    //S
    let sar: Price
    let sek: Price
    let sgd: Price
    //T
    let thb: Price
    let twd: Price
    //U
    let uah: Price
    //V
    let vef: Price
    let vnd: Price
    //Z
    let zar: Price
    //X
    let xdr: Price
    let xag: Price
    let xau: Price
    
    let bits: Price
    let sats: Price

}

struct Rates: Codable{
    let rates: Currency
}


