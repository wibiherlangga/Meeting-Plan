//
//  MeetingListViewModel.swift
//  Meeting-Plan
//
//  Created by herlangga wibi on 20/07/20.
//  Copyright © 2020 herlangga wibi. All rights reserved.
//

import Foundation

class MeetingListViewModel {
    
    let persistence: PersistenceManager
    var meeting = [Meeting]()
    
    init(persistence: PersistenceManager) {
        self.persistence = persistence
    }
    
    var getMeeting: [Meeting] {
        return meeting
    }
    
    func fetchMeeting() {
        meeting = persistence.fetch(Meeting.self)
    }
    
}
