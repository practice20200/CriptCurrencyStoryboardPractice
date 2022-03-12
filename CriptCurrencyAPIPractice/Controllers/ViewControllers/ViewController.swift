//
//  ViewController.swift
//  CriptCurrencyAPIPractice
//
//  Created by Apple New on 2022-02-03.
//

import UIKit
import Elements

class ViewController: UIViewController, UICollectionViewDelegateFlowLayout{
    
    //================ Elements =================
    @IBOutlet weak var settings: UIBarButtonItem!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
//Currency
    var usdPrice = ""
    var eurPrice = ""
    var gbpPrice = ""
    var chfPrice = ""
    var caddPrice = ""
    var audPrice = ""
    var sekPrice = ""
    var nokPrice = ""
    var rubPrice = ""
    
    //Coins
    var btcPrice = ""
    var ethdPrice = ""
    var ltcPrice = ""
    var bchPrice = ""
    var bnbdPrice = ""
    
    //Gold
    var xagPrice = ""
    var xauPrice = ""
   
    var data = MainCollectionViewData.dataProvider()
    var indextitle = ["Currency", "Coins", "Gold"]
    let urlString =  "https://api.coingecko.com/api/v3/exchange_rates"

    
 
    //================ Views =================
    override func viewDidLoad() {
        super.viewDidLoad()
        print("1")
        fetchData()
        let _ = Timer.scheduledTimer(timeInterval: 10, target: self, selector: #selector(refreshData), userInfo: nil, repeats: true)
        
//        let vc = storyboard?.instantiateViewController(withIdentifier: "coinsVCID") as! CoinsViewController
//        self.navigationController?.pushViewController(vc, animated: true)
    }

    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.backgroundColor = UIColor.white
       
        guard collectionView != nil else{
            print("Here: error===============")
            return }
        print("Here: Success===============")
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
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("2")
//        fetchData()
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
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            
            for i in self.data {
                print("data\(i)")
                for j in i.1{
                    print("data\(j)")
                    
                    if j.currencyTitle == "USD"{
                        self.usdPrice =  self.formatPrice(currency.usd)
                    }else if j.currencyTitle == "EUR"{
                        self.eurPrice =  self.formatPrice(currency.eur)
                    }else if j.currencyTitle == "GBP"{
                        self.gbpPrice =  self.formatPrice(currency.gbp)
                    }else if j.currencyTitle == "CHF"{
                        self.chfPrice =  self.formatPrice(currency.chf)
                    }else if j.currencyTitle == "CAD"{
                        self.caddPrice =  self.formatPrice(currency.cad)
                    }else if j.currencyTitle == "AUD"{
                        self.audPrice =  self.formatPrice(currency.aud)
                    }else if j.currencyTitle == "NOK"{
                        self.nokPrice =  self.formatPrice(currency.nok)
                    }else if j.currencyTitle == "RUB"{
                        self.rubPrice =  self.formatPrice(currency.rub)
                    }
                    
                    //Coins
                    else if j.currencyTitle == "BTC"{
                        self.btcPrice =  self.formatPrice(currency.btc)
                    }else if j.currencyTitle == "ETH"{
                        self.ethdPrice =  self.formatPrice(currency.eth)
                    }else if j.currencyTitle == "LTC"{
                        self.ltcPrice =  self.formatPrice(currency.ltc)
                    }else if j.currencyTitle == "BCH"{
                        self.bchPrice =  self.formatPrice(currency.bch)
                    }else if j.currencyTitle == "BNB"{
                        self.bnbdPrice =  self.formatPrice(currency.bnb)
                    }
                    
                    //Gold
                    else if j.currencyTitle == "XAG"{
                        self.xagPrice =  self.formatPrice(currency.xag)
                    }else if j.currencyTitle == "XAU"{
                       self.xauPrice =  self.formatPrice(currency.xau)
                    }
                }
            }
            
            self.dateLabel?.text = DateFormatters.dateForMatter(date: Date())
            self.collectionView.reloadData()
        }
            
    }

    func formatPrice(_ price: Price) -> String{
        return String(format: "%@ %.0f", price.unit, price.value)
    }

    @objc func refreshData() -> Void{
        print("3")
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
        cell.fullCurrencyTitle.text = item.fullCurrencyTitle.localized()
        cell.currencyTitle.text = item.currencyTitle.localized()
        
//        cell.delegate = self
         if cell.currencyTitle.text == "USD"{
             cell.previousRate.text = usdPrice
             cell.upToDateRate.text = usdPrice
         }else if cell.currencyTitle.text == "EUR"{
            cell.previousRate.text = eurPrice
            cell.upToDateRate.text = eurPrice
         }else if cell.currencyTitle.text == "GBP"{
            cell.previousRate.text = gbpPrice
            cell.upToDateRate.text = gbpPrice
        }else if cell.currencyTitle.text == "CHF"{
            cell.previousRate.text = chfPrice
            cell.upToDateRate.text = chfPrice
        }else if cell.currencyTitle.text == "CAD"{
            cell.previousRate.text = caddPrice
            cell.upToDateRate.text = caddPrice
        }else if cell.currencyTitle.text == "AUD"{
            cell.previousRate.text = audPrice
            cell.upToDateRate.text = audPrice
        }else if cell.currencyTitle.text == "NOK"{
            cell.previousRate.text = nokPrice
            cell.upToDateRate.text = nokPrice
        }else if cell.currencyTitle.text == "RUB"{
            cell.previousRate.text = rubPrice
            cell.upToDateRate.text = rubPrice
        }
        
        //Coins
        else if cell.currencyTitle.text == "BTC"{
            cell.previousRate.text = btcPrice
            cell.upToDateRate.text = btcPrice
        }else if cell.currencyTitle.text == "ETH"{
            cell.previousRate.text = ethdPrice
            cell.upToDateRate.text = ethdPrice
        }else if cell.currencyTitle.text == "LTC"{
            cell.previousRate.text = ltcPrice
            cell.upToDateRate.text = ltcPrice
        }else if cell.currencyTitle.text == "BCH"{
            cell.previousRate.text = bchPrice
            cell.upToDateRate.text = bchPrice
        }else if cell.currencyTitle.text == "BNB"{
            cell.previousRate.text = bnbdPrice
            cell.upToDateRate.text = bnbdPrice
        }
        
        else if cell.currencyTitle.text == "XAG"{
            cell.previousRate.text = xagPrice
            cell.upToDateRate.text = xagPrice
        }else if cell.currencyTitle.text == "XAU"{
            cell.previousRate.text = xauPrice
            cell.upToDateRate.text = xauPrice
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



//
//extension ViewController : MainCollectionViewCellDelegate {
//    func refreshAPIHandler(){
//        print("4")
//        fetchData()
//    }
//}

