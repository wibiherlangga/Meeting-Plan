//
//  ViewController.swift
//  Meeting-Plan
//
//  Created by herlangga wibi on 19/07/20.
//  Copyright © 2020 herlangga wibi. All rights reserved.
//

import UIKit

class MeetingListVC: UIViewController {
    
    let tableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    private func setDelegate() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func setupConstraints() {
        view.addSubview(tableView)
        
        
    }

}

extension MeetingListVC: UITableViewDelegate {
    
}

extension MeetingListVC: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "", for: indexPath)
        
        return cell
    }


}
