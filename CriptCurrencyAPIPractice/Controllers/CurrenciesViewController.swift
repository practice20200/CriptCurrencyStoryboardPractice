//
//  CurrenciesViewController.swift
//  CriptCurrencyAPIPractice
//
//  Created by Apple New on 2022-02-10.
//

import UIKit
import Elements

class CurrenciesViewController: UIViewController, UICollectionViewDelegateFlowLayout {
    
    //=================== Elements ===============
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    let urlString =  "https://api.coingecko.com/api/v3/exchange_rates"
    
    static var usdPrice = ""
    static var eurPrice = ""
    static var gbpPrice = ""
    static var chfPrice = ""
    static var caddPrice = ""
    static var audPrice = ""
    static var sekPrice = ""
    static var nokPrice = ""
    static var rubPrice = ""
    

    
    //@IBOutlet weak var collectionView: UICollectionView!

    var data = MainCollectionViewData.dataProvider()
    

    lazy var collectionView: UICollectionView = {
        
        let viewLayout =  UICollectionViewFlowLayout()
        viewLayout.scrollDirection = .vertical
        viewLayout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        let cv = UICollectionView(frame: .zero, collectionViewLayout: viewLayout)
        cv.backgroundColor = .white
        cv.delegate = self
        cv.dataSource = self
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = UIColor.systemGray5
        return cv
        
    }()
    
    
    
    //=================== Views ===============
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        title = "Currencies".localized()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.backgroundColor = UIColor.white
        view.addSubview(collectionView)
            collectionView.delegate = self
            collectionView.dataSource = self
            collectionView.register(MainCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        fetchData()
    }
    
    
    
    
    
    
    //=================== Functions ===============
        func coinInformationFinder() -> [CurrencyModel]{
            var array : [CurrencyModel] = []
            for i in data{
                print("i.0.title: \(i.0.title)")
                for j in i.1 {
                    if i.0.title == "Currencies"{
                        array.append(j.self)
                        print("Success: \(i.1)")
                    }
                }
            }
            print("array: \(array)")
            return  array
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
                }
                self.timeLabel?.text = DateFormatters.dateForMatter(date: Date())
                self.collectionView.reloadData()
            }
        }
    }
    func formatPrice(_ price: Price) -> String{
        return String(format: "%@ %.0f", price.unit, price.value)
    }

    @objc func refreshData() -> Void{
        fetchData()
    }
    
}

extension CurrenciesViewController : UICollectionViewDelegate {
    
}

extension CurrenciesViewController : UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return coinInformationFinder().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MainCollectionViewCell
        
        let item = coinInformationFinder()[indexPath.row]
        cell.currencyIconImage.image = item.currencyIcon
        cell.fullCurrencyTitle.text = item.fullCurrencyTitle.localized()
        cell.currencyTitle.text = item.currencyTitle.localized()
        
        cell.delegate = self
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
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = (collectionView.frame.height * 1/3)+20
        let width = (collectionView.frame.width * 1/2)-25
        return CGSize(width: width, height: height)
    }

}

extension CurrenciesViewController : MainCollectionViewCellDelegate{
    func refreshAPIHandler() {
        refreshData()
    }
}






//
//override func viewWillAppear(_ animated: Bool) {
//    super.viewWillAppear(animated)
//    view.backgroundColor = UIColor.white
//
//    guard collectionView != nil else{ return }
//    view.addSubview(collectionView)
//    let viewLayout =  UICollectionViewFlowLayout()
//    viewLayout.scrollDirection = .vertical
//    viewLayout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
//    collectionView.collectionViewLayout = viewLayout
//    collectionView.backgroundColor = .yellow
//    collectionView.translatesAutoresizingMaskIntoConstraints = false
//    collectionView.backgroundColor = UIColor.systemGray5
//
//    collectionView.delegate = self
//    collectionView.dataSource = self
//    collectionView.register(MainCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
//
//    timeLabel.text = DateFormatters.dateForMatter(date: Date())
//
//
//
//}

//
