//
//  LanguageSelectionDataProvider.swift
//  CriptCurrencyAPIPractice
//
//  Created by Apple New on 2022-02-11.
//
import Foundation
import UIKit
class LanguageSelectionDataProvider{
    static func dataProvider() -> [LanguageSelection]{
        var array = [LanguageSelection]()
        array.append(LanguageSelection(iconImage: UIImage(named: "english"), title: "English".localized(), isComplete: false))
        array.append(LanguageSelection(iconImage: UIImage(named: "japanese"), title: "Japanese".localized(), isComplete: false))
        return array
    }
}
