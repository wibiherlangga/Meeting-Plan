//
//  MeetingViewModel.swift
//  Meeting-Plan
//
//  Created by herlangga wibi on 20/07/20.
//  Copyright © 2020 herlangga wibi. All rights reserved.
//

import Foundation

class MeetingViewModel {
    
    let persistence: PersistenceManager
    var isUpdate: Bool
    var dataUpdate: Meeting
    
    init(persistence: PersistenceManager, isUpdate: Bool, dataUpdate: Meeting) {
        self.persistence = persistence
        self.isUpdate = isUpdate
        self.dataUpdate = dataUpdate
        
    }
    
    func save(title: String,
              desc: String,
              date: String,
              time: String,
              success: @escaping () -> Void) {
        
        if isUpdate {
            dataUpdate.title = title
            dataUpdate.deskripsi = desc
            dataUpdate.date = date
            dataUpdate.time = time
            
            persistence.save {
                success()
            }
        }
        else {
            let meeting = Meeting(context: persistence.context)
            meeting.title = title
            meeting.deskripsi = desc
            meeting.date = date
            meeting.time = time
            
            persistence.save {
                success()
            }
        }
        
    }
    
    func delete(success: @escaping () -> Void) {
        persistence.delete(dataUpdate)
        persistence.save {
            success()
        }
    }
}
