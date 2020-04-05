//
//  TimelineViewController.swift
//  Timeline
//
//  Created by Diego Trevisan Lara on 05.04.20.
//  Copyright © 2020 Diego Trevisan Lara. All rights reserved.
//

import UIKit

class TimelineViewController: UIViewController, ITimelineView {
    
    var configurator: ITimelineConfigurator!
    var presenter: ITimelinePresenter!
    
    @IBOutlet weak var promptsContainerView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - View
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(self)
        
        presenter.setupChildViews()
        presenter.loadTimelineEvents()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    // MARK: - ITimelineView
    
    func set(loading: Bool) {
        if loading {
            let loadingView = UIActivityIndicatorView(style: .medium)
            loadingView.startAnimating()
            tableView.backgroundView = loadingView
        } else {
            tableView.backgroundView = nil
        }
    }
    
    func reloadData() {
        tableView.reloadData()
    }
    
}

extension TimelineViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let timelineEvent = presenter.groupedTimelineEvents[indexPath.section].timelineEvents[indexPath.row]
        presenter.presentDetails(for: timelineEvent)
    }
    
}

extension TimelineViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return presenter.groupedTimelineEvents.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.groupedTimelineEvents[section].timelineEvents.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let group = presenter.groupedTimelineEvents[section]
        return EventGroupHeaderView(title: group.title)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let timelineEvent = presenter.groupedTimelineEvents[indexPath.section].timelineEvents[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "EventCell", for: indexPath) as! EventCell
        cell.timelineEvent = timelineEvent
        return cell
    }
    
}
