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
    
    var isDataTable: isDataTable = .empty
    
    private let viewModel: MeetingListViewModel
    
    init(viewModel: MeetingListViewModel) {
        self.viewModel = viewModel
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
        
        viewModel.fetchMeeting()
        let meeting = viewModel.getMeeting
        guard meeting.count > 0 else {
            self.isDataTable = .empty
            tableView.reloadData()
            return
        }
        isDataTable = .fill
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
        let viewModel = MeetingViewModel(persistence: PersistenceManager.shared, isUpdate: false, dataUpdate: Meeting())
        navigationController?.pushViewController(MeetingVC(viewModel: viewModel), animated: true)
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
            return viewModel.getMeeting.count
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
            cell.meetingTitle.text = viewModel.meeting[indexPath.row].title
            cell.meetingDate.text = viewModel.meeting[indexPath.row].date
            cell.meetingTime.text = viewModel.meeting[indexPath.row].time
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let getViewModel = MeetingViewModel(persistence: PersistenceManager.shared, isUpdate: true, dataUpdate: viewModel.getMeeting[indexPath.row])
        let vc = MeetingVC(viewModel: getViewModel)
        navigationController?.pushViewController(vc, animated: true)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
