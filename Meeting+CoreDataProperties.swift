//
//  Meeting+CoreDataProperties.swift
//  Meeting-Plan
//
//  Created by herlangga wibi on 20/07/20.
//  Copyright © 2020 herlangga wibi. All rights reserved.
//
//

import Foundation
import CoreData


extension Meeting {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Meeting> {
        return NSFetchRequest<Meeting>(entityName: "Meeting")
    }

    @NSManaged public var title: String
    @NSManaged public var deskripsi: String
    @NSManaged public var date: String
    @NSManaged public var time: String

}
