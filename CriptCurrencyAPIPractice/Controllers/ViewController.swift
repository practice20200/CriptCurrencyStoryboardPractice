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
    var indextitle = ["Currency", "Coins", "Gold"]
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
        
        
        

        
    }
    
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        collectionView.frame = view.bounds
//    }
//
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.backgroundColor = UIColor.white
       
        guard collectionView != nil else{ return }
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
        
        dateLabel.text = DateFormatters.dateForMatter(date: Date())
        
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
        cell.previousRate.text = item.previousRate
        cell.upToDateRate.text = item.upToDateRate
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = (collectionView.frame.height * 1/4)
        let width = (collectionView.frame.width * 1/2)-30
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
