//
//  DetailMarketViewController.swift
//  pass
//
//  Created by Chang Hwan Kim on 2018. 8. 25..
//  Copyright © 2018년 SogangRelease2018. All rights reserved.
//

import Foundation
import UIKit


class DetailMarketViewController: UITableViewController {
    
    var money = 0
    var moneyLabel: UILabel!
    var market: Market!
    class func getInstance(market: Market)->DetailMarketViewController{
        let vc = UIStoryboard(name: Config.sb.Main, bundle: nil).instantiateViewController(withIdentifier: Config.vc
        .DetailMarketViewController) as! DetailMarketViewController
        vc.market = market
        return vc
    }
    
    var datas: [CellModel] = []
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = market.name
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepare()
        self.tableView.refreshControl = UIRefreshControl()
        self.tableView.refreshControl?.addControlEvent(.valueChanged, {
            self.tableView.refreshControl?.beginRefreshing()
            self.removeAll(completion: { (_) in
                self.prepare()
            })
            self.tableView.refreshControl?.endRefreshing()
        })
    }
    
    func prepare(){
        if let marketId = market.id{
            API.model.pass.list(marketId: marketId) { (passes) in
                self.money = 0
                for pass in passes{
                    let data = PassCellModel(pass: pass)
                    self.money += data.money
                    if pass.status == 0{
                        self.insert(data: data)
                    }
                    if let label = self.moneyLabel{
                        label.text = "\(self.money) 원"
                    }
                }
            }
        }
    }
    
    func removeAll(completion: @escaping (Bool)->Void){
        self.tableView.performBatchUpdates({
            var indexPaths: [IndexPath] = []
            for (idx, _) in self.datas.enumerated(){
                indexPaths.append(IndexPath(item: idx, section: 0))
            }
            self.datas.removeAll()
            self.tableView.deleteRows(at: indexPaths, with: .automatic)
        }) { (success) in
            completion(success)
        }
    }
    
    func insert(data: CellModel){
        self.tableView.performBatchUpdates({
            self.datas.append(data)
            let indexPaths = [IndexPath(item: datas.count-1, section: 0)]
            self.tableView.insertRows(at: indexPaths, with: .automatic)
        }, completion: nil)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let data = datas[indexPath.item] as? PassCellModel{
            let cell = tableView.dequeueReusableCell(withIdentifier: Config.cell.PassCell) as! PassCell
            cell.data = data
            return cell
        }
        return UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(80)
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat(1)
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat(120)
    }
    
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let screen = UIScreen().bounds
        let view = UIView(frame: CGRect(x: 0, y: 0, width: screen.width, height: 120))
        view.backgroundColor = .white
        let headerLabel = UILabel(frame: CGRect(x: 20, y: 20, width: 1000, height: 30))
        if let name = market.name{
            headerLabel.text = "\(name), 당일 매출"
            headerLabel.font = UIFont.systemFont(ofSize: 24, weight: UIFont.Weight.light)
        }
        if moneyLabel != nil{
            moneyLabel.removeFromSuperview()
            moneyLabel = nil
        }
        moneyLabel = UILabel(frame: CGRect(x: 20, y: 50, width: 1000, height: 60))
        moneyLabel.text = "\(self.money) 원"
        moneyLabel.font = UIFont.systemFont(ofSize: 40, weight: UIFont.Weight.bold)
        view.addSubview(headerLabel)
        view.addSubview(moneyLabel)
        return view
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let data = datas[indexPath.item] as? PassCellModel{
            if let passId = data.pass.id{
                API.model.pass.put(passId: passId) { (_) in
                    self.removeAll(completion: { (_) in
                        self.prepare()
                    })
                }
            }
        }
    }
    
}
