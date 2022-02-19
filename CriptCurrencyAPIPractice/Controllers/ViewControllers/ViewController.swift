//
//  ViewController.swift
//  CriptCurrencyAPIPractice
//
//  Created by Apple New on 2022-02-03.
//

import UIKit
import Elements

class ViewController: UIViewController, UICollectionViewDelegateFlowLayout {
    
    //================ Elements =================
    @IBOutlet weak var settings: UIBarButtonItem!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
//Currency
    static var usdPrice = ""
    static var eurPrice = ""
    static var gbpPrice = ""
    static var chfPrice = ""
    static var caddPrice = ""
    static var audPrice = ""
    static var sekPrice = ""
    static var nokPrice = ""
    static var rubPrice = ""
    
    //Coins
    static var btcPrice = ""
    static var ethdPrice = ""
    static var ltcPrice = ""
    static var bchPrice = ""
    static var bnbdPrice = ""
    
    //Gold
    static var xagPrice = ""
    static var xauPrice = ""
   
    var data = MainCollectionViewData.dataProvider()
    var indextitle = ["Currency", "Coins", "Gold"]
    let urlString =  "https://api.coingecko.com/api/v3/exchange_rates"

    
 
    //================ Views =================
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
        let _ = Timer.scheduledTimer(timeInterval: 10, target: self, selector: #selector(refreshData), userInfo: nil, repeats: true)
        
//        let vc = storyboard?.instantiateViewController(withIdentifier: "coinsVCID") as! CoinsViewController
//        self.navigationController?.pushViewController(vc, animated: true)
    }

    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.backgroundColor = UIColor.white
       
        guard collectionView != nil else{
            print("Here: error as well===============")
            return }
        print("Here: Successsssssss as well===============")
        view.addSubview(collectionView)
        let viewLayout =  UICollectionViewFlowLayout()
        viewLayout.scrollDirection = .vertical
        viewLayout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        collectionView.collectionViewLayout = viewLayout
        collectionView.backgroundColor = .white
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = UIColor.systemGray5
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(MainCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        
        collectionView.register(HeaderCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCollectionReusableView.identifier)
        
    }
    
    
    //================ functions =================
    @IBAction func settingHandler(_ sender: Any) {
        let vc = SettingsViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
 
    func fetchData(){
        guard let url = URL(string: urlString) else { return }
        let defaultSession = URLSession(configuration: .default)
        let dataTask = defaultSession.dataTask(with: url){ (data: Data?, response: URLResponse?, error: Error?) in

            if error != nil{ return }

            do{
                let json = try JSONDecoder().decode(Rates.self, from: data!)
                self.setPrices(currency:  json.rates)
            }catch{
                print("erorr")
                return
            }

        }
        dataTask.resume()
    
    }

    func setPrices(currency: Currency){
        DispatchQueue.main.async {
            for i in self.data {
                print("data\(i)")
                for j in i.1{
                    print("data\(j)")
                    if j.currencyTitle == "USD"{
                        ViewController.usdPrice =  self.formatPrice(currency.usd)
                    }else if j.currencyTitle == "EUR"{
                        ViewController.eurPrice =  self.formatPrice(currency.eur)
                    }else if j.currencyTitle == "GBP"{
                        ViewController.gbpPrice =  self.formatPrice(currency.gbp)
                    }else if j.currencyTitle == "CHF"{
                        ViewController.chfPrice =  self.formatPrice(currency.chf)
                    }else if j.currencyTitle == "CAD"{
                        ViewController.caddPrice =  self.formatPrice(currency.cad)
                    }else if j.currencyTitle == "AUD"{
                        ViewController.audPrice =  self.formatPrice(currency.aud)
                    }else if j.currencyTitle == "SEK"{
                        ViewController.sekPrice =  self.formatPrice(currency.sek)
                    }else if j.currencyTitle == "NOK"{
                        ViewController.nokPrice =  self.formatPrice(currency.nok)
                    }else if j.currencyTitle == "RUB"{
                        ViewController.rubPrice =  self.formatPrice(currency.rub)
                    }
                    
                    //Coins
                    else if j.currencyTitle == "BTC"{
                        ViewController.btcPrice =  self.formatPrice(currency.btc)
                    }else if j.currencyTitle == "ETH"{
                        ViewController.ethdPrice =  self.formatPrice(currency.eth)
                    }else if j.currencyTitle == "LTC"{
                        ViewController.ltcPrice =  self.formatPrice(currency.ltc)
                    }else if j.currencyTitle == "BCH"{
                        ViewController.bchPrice =  self.formatPrice(currency.bch)
                    }else if j.currencyTitle == "BNB"{
                        ViewController.bnbdPrice =  self.formatPrice(currency.bnb)
                    }
                    
                    //Gold
                    else if j.currencyTitle == "XAG"{
                        ViewController.xagPrice =  self.formatPrice(currency.xag)
                    }else if j.currencyTitle == "XAU"{
                        ViewController.xauPrice =  self.formatPrice(currency.xau)
                    }
                    
                }
            }
            
            self.dateLabel?.text = DateFormatters.dateForMatter(date: Date())
        }
            
    }

    func formatPrice(_ price: Price) -> String{
        return String(format: "%@ %.0f", price.unit, price.value)
    }

    @objc func refreshData() -> Void{
        fetchData()
    }
}



extension ViewController : UICollectionViewDelegate {
    
}

extension ViewController : UICollectionViewDataSource {
    
    func numberOfSections(in tableView: UICollectionView) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let sectionData = data[section]
        return sectionData.1.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MainCollectionViewCell
        
        let item = data[indexPath.section].1[indexPath.row]
        cell.currencyIconImage.image = item.currencyIcon
        cell.fullCurrencyTitle.text = item.fullCurrencyTitle
        cell.currencyTitle.text = item.currencyTitle
        
         if cell.currencyTitle.text == "USD"{
             cell.previousRate.text = ViewController.usdPrice
             cell.upToDateRate.text = ViewController.usdPrice
         }else if cell.currencyTitle.text == "EUR"{
            cell.previousRate.text = ViewController.eurPrice
            cell.upToDateRate.text = ViewController.eurPrice
         }else if cell.currencyTitle.text == "GBP"{
            cell.previousRate.text = ViewController.gbpPrice
            cell.upToDateRate.text = ViewController.gbpPrice
        }else if cell.currencyTitle.text == "CHF"{
            cell.previousRate.text = ViewController.chfPrice
            cell.upToDateRate.text = ViewController.chfPrice
        }else if cell.currencyTitle.text == "AUD"{
            cell.previousRate.text = ViewController.audPrice
            cell.upToDateRate.text = ViewController.audPrice
        }else if cell.currencyTitle.text == "SEK"{
            cell.previousRate.text = ViewController.sekPrice
            cell.upToDateRate.text = ViewController.sekPrice
        }else if cell.currencyTitle.text == "NOK"{
            cell.previousRate.text = ViewController.nokPrice
            cell.upToDateRate.text = ViewController.nokPrice
        }else if cell.currencyTitle.text == "GBP"{
            cell.previousRate.text = ViewController.gbpPrice
            cell.upToDateRate.text = ViewController.gbpPrice
        }
        
        //Coins
        else if cell.currencyTitle.text == "BTC"{
            cell.previousRate.text = ViewController.btcPrice
            cell.upToDateRate.text = ViewController.btcPrice
        }else if cell.currencyTitle.text == "ETH"{
            cell.previousRate.text = ViewController.ethdPrice
            cell.upToDateRate.text = ViewController.ethdPrice
        }else if cell.currencyTitle.text == "LTC"{
            cell.previousRate.text = ViewController.ltcPrice
            cell.upToDateRate.text = ViewController.ltcPrice
        }else if cell.currencyTitle.text == "BCH"{
            cell.previousRate.text = ViewController.bchPrice
            cell.upToDateRate.text = ViewController.bchPrice
        }else if cell.currencyTitle.text == "BNB"{
            cell.previousRate.text = ViewController.bnbdPrice
            cell.upToDateRate.text = ViewController.bnbdPrice
        }
        
        else if cell.currencyTitle.text == "XAG"{
            cell.previousRate.text = ViewController.xagPrice
            cell.upToDateRate.text = ViewController.xagPrice
        }else if cell.currencyTitle.text == "XAU"{
            cell.previousRate.text = ViewController.xauPrice
            cell.upToDateRate.text = ViewController.xauPrice
        }
    
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = (collectionView.frame.height * 1/3)+20
        let width = (collectionView.frame.width * 1/2)-25
        return CGSize(width: width, height: height)
    }


    
    //=========Header
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderCollectionReusableView.identifier, for: indexPath) as? HeaderCollectionReusableView
        else { return UICollectionReusableView()}

        header.iconImage.image = data[indexPath.section].0.icon
        header.titleLabel.text = data[indexPath.section].0.title
        
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: 100, height: 20)
    }
    
    
}


extension String{
    func localized() -> String{
        return NSLocalizedString(self,
                                 tableName: "Localizable",
                                 bundle: .main,
                                 value: self,
                                 comment: self)
    }
}



//static func dataProvider() -> [Price] {
//    var arrayOfCurrencies = [
//                         aed, ars, aud, bdt, bhd, bmd, brl, cad, chf, clp, cny, czk, dkk, eur,
//                         gbp, hkd, huf, idr, ils, inr, jpy, krw, lkr, mmk, mxn, myr, ngn, nok,
//                         nzd, php, pkr, pln, rub, sar, sek, sgd, thb, twd, uah, vef, vnd, zar,
//                         xdr, xag, xau ]
//    return arrayOfCurrencies
//
//}
