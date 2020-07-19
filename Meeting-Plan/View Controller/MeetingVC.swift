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
       let meetingDate = UITextField()
        meetingDate.placeholder = "Input Date here..."
        meetingDate.borderStyle = .roundedRect
        return meetingDate
    }()
    
    let meetingTime: UITextField = {
       let meetingTime = UITextField()
        meetingTime.placeholder = "Input Time here..."
        meetingTime.borderStyle = .roundedRect
        return meetingTime
    }()
    
    let datePicker: UIDatePicker = {
        let startDate = UIDatePicker()
        startDate.backgroundColor = .white
        startDate.datePickerMode = .date
        startDate.timeZone = .current
        startDate.addTarget(self, action: #selector(setStartDateChanged(_:)), for: .valueChanged)
        return startDate
    }()
    
    let timePicker: UIDatePicker = {
       let time = UIDatePicker()
        time.backgroundColor = .white
        time.datePickerMode = .time
        time.addTarget(self, action: #selector(setTime(_:)), for: .valueChanged)
        return time
    }()
    
    let toolBar: UIToolbar = {
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(onClickDoneButton))
        toolBar.setItems([space, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        toolBar.sizeToFit()
        return toolBar
    }()
    
    let meetingBtn: UIButton = {
       let meetingBtn = UIButton()
        meetingBtn.setTitle("Save", for: .normal)
        meetingBtn.backgroundColor = .systemBlue
        meetingBtn.layer.cornerRadius = 5
        meetingBtn.addTarget(self, action: #selector(btnPressed(_:)), for: .touchUpInside)
        return meetingBtn
    }()
        
    let persistence: PersistenceManager
    
    init(persistence: PersistenceManager) {
        self.persistence = persistence
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeHideKeyboard()
        configLayout()
        setDelegate()
    }
    
    private func setDelegate() {
        
        meetingDate.inputView = datePicker
        meetingDate.inputAccessoryView = toolBar
        
        meetingTime.inputView = timePicker
        meetingTime.inputAccessoryView = toolBar
        
    }
    
    @objc func dismissKeyboard() {
        self.view.endEditing(true)
    }
    
    @objc
    private func onClickDoneButton() {
        self.view.endEditing(true)
    }
    
    @objc
    private func setStartDateChanged(_ sender: UIDatePicker) {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        meetingDate.text = formatter.string(from: sender.date)
    }

    @objc
    private func setTime(_ sender: UIDatePicker) {
        let formatter = DateFormatter()
        formatter.dateStyle = .none
        formatter.timeStyle = .short
        meetingTime.text = formatter.string(from: sender.date)
    }

    
    @objc
    private func btnPressed(_ sender: UIButton) {
        save()
    }
    
    @objc
    private func save() {
        
        let meeting = Meeting(context: persistence.context)
        
        guard
            let title = meetingTitle.text, !title.isEmpty,
            let desc = meetingDescription.text, !desc.isEmpty,
            let date = meetingDate.text, !date.isEmpty,
            let time = meetingTime.text, !date.isEmpty
            else {
                print("there's textfield contain null")
                return
        }
        
        meeting.title = title
        meeting.deskripsi = desc
        meeting.date = date
        meeting.time = time
        
        persistence.save(success: {
            Helper.showAlert(message: "Saved Successfully", vc: self)
        })
        
    }
    
    func initializeHideKeyboard(){
    //Declare a Tap Gesture Recognizer which will trigger our dismissMyKeyboard() function
    let tap: UITapGestureRecognizer = UITapGestureRecognizer(
    target: self,
    action: #selector(dismissMyKeyboard))
    //Add this tap gesture recognizer to the parent view
    view.addGestureRecognizer(tap)
    }
    
    @objc func dismissMyKeyboard(){
    //In short- Dismiss the active keyboard.
    view.endEditing(true)
    }
    
    private func configLayout() {
        
        view.backgroundColor = .white
        
        view.isUserInteractionEnabled = true
        
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
