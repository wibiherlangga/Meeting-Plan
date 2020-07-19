//
//  MeetingVC.swift
//  Meeting-Plan
//
//  Created by herlangga wibi on 19/07/20.
//  Copyright © 2020 herlangga wibi. All rights reserved.
//

import UIKit
import SnapKit

class MeetingVC: UIViewController {
    
    let titlePage: UILabel = {
       let title = UILabel()
        title.text = "Create New Meeting"
        title.font = title.font.withSize(30)
        return title
    }()
    
    let meetingTitle: UITextField = {
       let meetingTitle = UITextField()
        meetingTitle.placeholder = "Input meeting here..."
        meetingTitle.borderStyle = .roundedRect
        return meetingTitle
    }()
    
    let meetingDescription: UITextView = {
       let meetingDescription = UITextView()
        meetingDescription.layer.cornerRadius = 5
        meetingDescription.layer.borderWidth = 1
        meetingDescription.layer.borderColor = UIColor.lightGray.cgColor
        return meetingDescription
    }()
    
    let meetingDate: UITextField = {
       let meetingTitle = UITextField()
        meetingTitle.placeholder = "Input Date here..."
        meetingTitle.borderStyle = .roundedRect
        return meetingTitle
    }()
    
    let meetingTime: UITextField = {
       let meetingTitle = UITextField()
        meetingTitle.placeholder = "Input Time here..."
        meetingTitle.borderStyle = .roundedRect
        return meetingTitle
    }()
    
    let meetingBtn: UIButton = {
       let meetingBtn = UIButton()
        meetingBtn.setTitle("Save", for: .normal)
        meetingBtn.backgroundColor = .systemBlue
        meetingBtn.layer.cornerRadius = 5
        return meetingBtn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configLayout()
        
    }
    
    private func configLayout() {
        view.addSubview(titlePage)

        let navHeight = (navigationController?.navigationBar.frame.height)!
        
        titlePage.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(navHeight + 10)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
        }
        
        view.addSubview(meetingTitle)
        meetingTitle.snp.makeConstraints { (make) in
            make.top.equalTo(titlePage.snp.bottom).offset(30)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.height.equalTo(50)
        }
        
        view.addSubview(meetingDescription)
        meetingDescription.snp.makeConstraints { (make) in
            make.top.equalTo(meetingTitle.snp.bottom).offset(30)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.height.equalTo(100)
        }
        
        view.addSubview(meetingDate)
        meetingDate.snp.makeConstraints { (make) in
            make.top.equalTo(meetingDescription.snp.bottom).offset(30)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.height.equalTo(50)
        }
        
        view.addSubview(meetingTime)
        meetingTime.snp.makeConstraints { (make) in
            make.top.equalTo(meetingDate.snp.bottom).offset(30)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.height.equalTo(50)
        }
        
        view.addSubview(meetingBtn)
        meetingBtn.snp.makeConstraints { (make) in
            make.top.equalTo(meetingTime.snp.bottom).offset(50)
            make.left.equalToSuperview().offset(50)
            make.right.equalToSuperview().offset(-50)
            make.height.equalTo(50)
        }
    }

}
