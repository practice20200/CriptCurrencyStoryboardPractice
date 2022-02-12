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

   
    
    var data = MainCollectionViewData.dataProvider()
    //@IBOutlet weak var btcPrice: UILabel!
//    @IBOutlet weak var ethPrice: UILabel!
//    @IBOutlet weak var usdPrice: UILabel!
//    @IBOutlet weak var ausdPric: UILabel!
//    @IBOutlet weak var lastUpdatePrice: UILabel!
//
//    let urlString =  "https://api.coingecko.com/api/v3/exchange_rates"
//
    
    
    
    
    
    
    
    
    
    //================ Viewa =================
    override func viewDidLoad() {
        super.viewDidLoad()
//        fetchData()
//
//        let _ = Timer.scheduledTimer(timeInterval: 10, target: self, selector: #selector(refreshData), userInfo: nil, repeats: true)
//
        
        
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

        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
            //collectionView.bounds = frame.
    }
    
    
    
    
    //================ functions =================
    @IBAction func settingHandler(_ sender: Any) {
        let vc = SettingsViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
    
//
//    func fetchData(){
//        guard let url = URL(string: urlString) else{ return }
//        let defaultSession = URLSession(configuration: .default)
//        let dataTask = defaultSession.dataTask(with: url){ (data: Data?, response: URLResponse?, error: Error?) in
//
////            guard let error != nil else{ return }
//            //guard let data != nil else{ return }
//
//            if error != nil{ return }
//
//            do{
//                let json = try JSONDecoder().decode(Rates.self, from: data!)
//                self.setPrices(currency:  json.rates)
//            }catch{
//                print("erorr")
//                return
//            }
//
//        }
//        dataTask.resume()
    
    //    }
//
//
//
//
//
//    func setPrices(currency: Currency){
//        DispatchQueue.main.async {
//            self.btcPrice.text = self.formatPrice(currency.btc)
//            self.ethPrice.text = self.formatPrice(currency.eth)
//            self.usdPrice.text = self.formatPrice(currency.usd)
//            self.ausdPric.text = self.formatPrice(currency.aud)
//            self.lastUpdatePrice.text = self.formatDate(date: Date())
//        }
//    }
//
//    func formatPrice(_ price: Price) -> String{
//        return String(format: "%@ %.4f", price.unit, price.value)
//    }
//
//    func formatDate(date: Date) -> String{
//        let formatter = DateFormatter()
//        formatter.dateFormat = "dd/MMM/yy HH:mm:ss"
//        return formatter.string(from: date)
//    }
//
//
//    @objc func refreshData() -> Void{
//        fetchData()
//    }
}
//
//
//
//struct Price: Codable{
//    let name: String
//    let unit: String
//    let value: Float
//    let type: String
//}
//
//struct Currency : Codable{
//    let btc: Price
//    let eth: Price
//    let usd: Price
//    let aud: Price
//}
//
//struct Rates: Codable{
//    let rates: Currency
//}


extension ViewController : UICollectionViewDelegate {
    
}

extension ViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MainCollectionViewCell
        
        let item = data[indexPath.row]
        cell.currencyIconImage.image = item.currencyIcon
        cell.fullCurrencyTitle.text = item.fullCurrencyTitle
        cell.currencyTitle.text = item.currencyTitle
        cell.previousRate.text = item.previousRate
        cell.upToDateRate.text = item.upToDateRate
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = (collectionView.frame.height * 1/3)
        let width = (collectionView.frame.width * 1/2)-30
        return CGSize(width: width, height: height)
    }
}
