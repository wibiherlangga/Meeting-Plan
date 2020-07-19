//
//  MeetingListCell.swift
//  Meeting-Plan
//
//  Created by herlangga wibi on 19/07/20.
//  Copyright © 2020 herlangga wibi. All rights reserved.
//

import UIKit

class MeetingListCell: UITableViewCell {
    
    @IBOutlet weak var meetingTitle: UILabel!
    @IBOutlet weak var meetingDate: UILabel!
    @IBOutlet weak var meetingTime: UILabel!
    @IBOutlet weak var meetingImg: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell() {
        
    }
    
}
