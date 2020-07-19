//
//  ViewController.swift
//  Meeting-Plan
//
//  Created by herlangga wibi on 19/07/20.
//  Copyright © 2020 herlangga wibi. All rights reserved.
//

import UIKit
import SnapKit

class MeetingListVC: UIViewController {
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.tableFooterView = UIView()
        return tableView
    }()
    
    private let cellId = "MeetingListCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupConstraints()
        setDelegate()
        
    }
    
    private func setDelegate() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: cellId, bundle: nil), forCellReuseIdentifier: cellId)
    }
    
    private func setupConstraints() {
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { (make) in
            make.top.leading.trailing.bottom.equalToSuperview()
        }
        
    }
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Meetings"
        let addBarButtomItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addMeeting(_:)))
        navigationItem.rightBarButtonItem = addBarButtomItem
    }
    
    @objc
    private func addMeeting(_ sender: UIBarButtonItem) {
        print("add meeting button pressed")
    }

}

extension MeetingListVC: UITableViewDelegate {
    
}

extension MeetingListVC: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! MeetingListCell
        
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
