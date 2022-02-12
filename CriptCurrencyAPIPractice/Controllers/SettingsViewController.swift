//
//  SettingsViewController.swift
//  CriptCurrencyAPIPractice
//
//  Created by Apple New on 2022-02-10.
//

import UIKit

class SettingsViewController: UIViewController {
    
    var data = SettingTitleDataProvider.dataProvider()

    
    lazy var tableView : UITableView = {
        let table = UITableView()
        table.register(SettingTableViewCell.self, forCellReuseIdentifier: "cell")
        table.backgroundColor = UIColor.systemGray6
        table.layer.shadowColor = UIColor.lightGray.cgColor
        table.layer.opacity = 0.8
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        tableView.delegate = self
        tableView.dataSource = self
        
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
        
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            //tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        
        ])
   
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }


}

extension SettingsViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        data[indexPath.row].isComplete.toggle()
        tableView.reloadData()
        
        let index = data[indexPath.row].title
        if index == "All"{
            let vc = ViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        }else if index == "Currencies"{
            let vc = CurrenciesViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        }else if index == "Coins"{
            let vc = CoinsViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        }else if index == "Gold"{
            let vc = GoldViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        }else if index == "Change Language"{
            let vc = LanguageChangeViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        }
            
    }
}

extension SettingsViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SettingTableViewCell
        let item = data[indexPath.row]
        cell.iconImage.image = item.iconImage
        cell.titleLabel.text = item.title
        cell.accessoryType = item.isComplete ? .checkmark : .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}


