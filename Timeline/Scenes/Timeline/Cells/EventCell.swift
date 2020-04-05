//
//  EventCell.swift
//  Timeline
//
//  Created by Diego Trevisan Lara on 05.04.20.
//  Copyright © 2020 Diego Trevisan Lara. All rights reserved.
//

import UIKit

class EventCell: UITableViewCell {
    
    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var subtitleLabel: UILabel!
    
    var timelineEvent: TimelineEvent? {
        didSet {
            titleLabel.text = timelineEvent?.title
            subtitleLabel.text = timelineEvent?.description
        }
    }

}
