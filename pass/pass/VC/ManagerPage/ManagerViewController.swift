//
//  ManagerMarketTableViewController.swift
//  pass
//
//  Created by Chang Hwan Kim on 2018. 8. 25..
//  Copyright © 2018년 SogangRelease2018. All rights reserved.
//

import Foundation
import UIKit
import ActionKit
import UIScrollView_InfiniteScroll

class ManagerViewController: UITableViewController {
    
    var datas: [CellModel] = []
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepare()
        self.tableView.refreshControl = UIRefreshControl()
        self.tableView.refreshControl?.addControlEvent(.valueChanged, {
            self.tableView.refreshControl?.beginRefreshing()
            self.prepare()
            self.tableView.refreshControl?.endRefreshing()
        })
    }
    
    @IBAction func logout(_ sender: Any) {
        API.model.user.logout { (_) in
            self.navigationController?.dismiss(animated: true, completion: nil)
        }
    }
    
    @IBAction func addMarket(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: Config.vc.AddMarketViewController)
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    func prepare(){
        API.model.user.me { (me) in
            if let myId = me?.id{
                API.model.market.list(userId: myId, callback: { (markets) in
                    self.removeAll(completion: { (_) in
                        for market in markets{
                            let data = MarketCellModel(market: market)
                            self.insert(data: data)
                        }
                    })
                })
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
        if let data = datas[indexPath.item] as? MarketCellModel{
            let cell = tableView.dequeueReusableCell(withIdentifier: Config.cell.MarketCell) as! MarketCell
            cell.data = data
            return cell
        }
        return UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(92)
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat(1)
    }
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let data = datas[indexPath.item] as? MarketCellModel{
            let vc = DetailMarketViewController.getInstance(market: data.market)
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}
