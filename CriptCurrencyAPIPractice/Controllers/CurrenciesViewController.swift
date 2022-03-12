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
    
    var usdPrice = ""
    var eurPrice = ""
    var gbpPrice = ""
    var chfPrice = ""
    var caddPrice = ""
    var audPrice = ""
    var sekPrice = ""
    var nokPrice = ""
    var rubPrice = ""
    

    
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
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = (collectionView.frame.height * 1/3)+20
        let width = (collectionView.frame.width * 1/2)-25
        return CGSize(width: width, height: height)
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
