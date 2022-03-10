//
//  Extension.swift
//  CriptCurrencyAPIPractice
//
//  Created by Apple New on 2022-03-10.
//

import Foundation
extension String{
    func localized() -> String{
        return NSLocalizedString(self,
                                 tableName: "Localizable",
                                 bundle: .main,
                                 value: self,
                                 comment: self)
    }
}
