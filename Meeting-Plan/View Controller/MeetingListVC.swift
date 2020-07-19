//
//  ViewController.swift
//  Meeting-Plan
//
//  Created by herlangga wibi on 19/07/20.
//  Copyright © 2020 herlangga wibi. All rights reserved.
//

import UIKit
import SnapKit

enum isDataTable {
    case empty
    case fill
}

class MeetingListVC: UIViewController {
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.tableFooterView = UIView()
        return tableView
    }()
    
    private let cellId = "MeetingListCell"
    
    var meeting = [Meeting]()
    
    let persistence: PersistenceManager
    
    var isDataTable: isDataTable = .empty
    
    init(persistence: PersistenceManager) {
        self.persistence = persistence
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        debugPrint(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))
        setupNavigationBar()
        setupConstraints()
        setDelegate()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        meeting = persistence.fetch(Meeting.self)
        
        print("meeting count: \(meeting.count)")
        guard meeting.count > 0 else {
            self.isDataTable = .empty
            return
        }
        isDataTable = .fill
        print("meeting data: \(meeting[0].title)")
        tableView.reloadData()
    }
    
    private func setDelegate() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: cellId, bundle: nil), forCellReuseIdentifier: cellId)
    }
    
    private func setupConstraints() {
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { (make) in
            make.top.left.right.bottom.equalToSuperview()
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
        navigationController?.pushViewController(MeetingVC(persistence: PersistenceManager.shared), animated: true)
    }

}

extension MeetingListVC: UITableViewDelegate {
    
}

extension MeetingListVC: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch isDataTable {
        case .empty:
            return 0
        case .fill:
            return meeting.count
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch isDataTable {
        case .empty:
            let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! MeetingListCell
            cell.meetingTitle.text = ""
            return cell
        case .fill:
            let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! MeetingListCell
            cell.meetingTitle.text = meeting[indexPath.row].title
            cell.meetingDate.text = meeting[indexPath.row].date
            cell.meetingTime.text = meeting[indexPath.row].time
            return cell
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
