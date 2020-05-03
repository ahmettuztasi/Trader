//
//  PortfolioViewControler.swift
//  Trader
//
//  Created by admin on 1.05.2020.
//  Copyright © 2020 ahmet. All rights reserved.
//

import UIKit

class PortfolioViewController: UITableViewController {
    
    var portfolioModel: PortfolioModel? {
        didSet {
            self.hideActivityIndicator()
            if portfolioModel?.result.state == true {
                // Reload the table view
                tableView.reloadData()
            }
            else {
                // Show alert
                let alert = UIAlertController(title: "Istek Basarisiz", message: portfolioModel?.result.resultDescription, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "TAMAM", style: .default, handler: { action in
                    
                    // Start activity indicator
                    self.showActivityIndicator()
                    
                    // Get user portfolio
                    self.getPortfolio()
                }))
                self.present(alert, animated: true)
            }
        }
    }
    
    var activityIndicator: UIActivityIndicatorView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        // Get Portfolio
        getPortfolio()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        // Start activity indicator
        showActivityIndicator()
    }
}

// TableView Extension
extension PortfolioViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return portfolioModel?.item.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell =  Bundle.main.loadNibNamed("FirstRowTableViewCell", owner: self, options: nil)?.first as! FirstRowTableViewCell
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  Bundle.main.loadNibNamed("RowTableViewCell", owner: self, options: nil)!.first as! RowTableViewCell
        if portfolioModel?.item[indexPath.item] != nil {
            cell.setRow(symbol: (portfolioModel?.item[indexPath.item].symbol)!,
                        amount: (portfolioModel?.item[indexPath.item].qtyT2)!,
                        lastPx: (portfolioModel?.item[indexPath.item].lastPx)!)
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let cell =  Bundle.main.loadNibNamed("LastRowTableViewCell", owner: self, options: nil)?.first as! LastRowTableViewCell
        if portfolioModel != nil {
            cell.calculateGrandTotal(portfolio: portfolioModel!)
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 30
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if portfolioModel?.item.count ?? 0 > 0 {
            return 30
        }
        else {
            // If portfolio model is nil, dont show header
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if portfolioModel?.item.count ?? 0 > 0 {
            return 30
        }
        else {
            // If portfolio model is nil, dont show footer
            return 0
        }
    }
}

// API Call Extension
extension PortfolioViewController {
    
    func getPortfolio() {
        let defaults = UserDefaults.standard
        ConnectionManager().setBaseUrl(url: HttpLink.mainURL.rawValue)
            .setMethod(method: .get)
            .setBodyParameter(parameter:
                ParameterBuilder()
                    .setMsgType("AN")
                    .setUsername(defaults.string(forKey: "userName") ?? "")
                    .setPassword(defaults.string(forKey: "password") ?? "")
                    .setAccountID(defaults.string(forKey: "defaultAccount") ?? "")
                    .setExchangeID("4")
                    .setOutputType("2")
                    .createParameters())
            .sendRequest { (response) in
                
                switch response {
                case .success(let data):
                    do {
                        self.portfolioModel = try JSONDecoder().decode(PortfolioModel.self, from: data)
                    } catch { print(error) }
                    
                case .failure(let error):
                    print(error)
                }
        }
    }
}

// Activity Indicator Extension
extension PortfolioViewController {
    
    func showActivityIndicator() {
        activityIndicator = UIActivityIndicatorView(style: .gray)
        activityIndicator?.center = self.view.center
        self.view.addSubview(activityIndicator!)
        activityIndicator?.startAnimating()
    }
    
    func hideActivityIndicator() {
        if activityIndicator != nil {
            activityIndicator?.stopAnimating()
        }
    }
}
