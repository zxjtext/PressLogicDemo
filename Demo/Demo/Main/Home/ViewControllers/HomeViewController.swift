//
//  HomeViewController.swift
//  Demo
//
//  Created by 张祥军 on 2021/5/17.
//

import UIKit

class HomeViewController: BaseViewController {

    @IBOutlet var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let appItemCell = UINib(nibName: "appItemTableViewCell", bundle: nil)
        tableView.register(appItemCell, forCellReuseIdentifier: NSStringFromClass(appItemTableViewCell.self))
    }

}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 40
        }
        return 200
    }
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 0
        }
        return 20
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            return appItemRecommendHeadView()
        }
        return appItemHeadView()
    
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier:  NSStringFromClass(appItemTableViewCell.self), for: indexPath) as! appItemTableViewCell
            return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 100
    }
}
