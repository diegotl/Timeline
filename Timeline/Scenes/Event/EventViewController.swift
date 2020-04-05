//
//  EventViewController.swift
//  Timeline
//
//  Created by Diego Trevisan Lara on 05.04.20.
//  Copyright © 2020 Diego Trevisan Lara. All rights reserved.
//

import UIKit

class EventViewController: UIViewController, IEventView {
    
    var configurator: IEventConfigurator!
    var presenter: IEventPresenter!
    
    @IBOutlet private weak var titleLabel: UILabel!
    
    // MARK: - View
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(self)
        
        setupUI()
    }
    
    private func setupUI() {
        titleLabel.text = presenter.title
    }
    
    // MARK: - Actions
    
    @IBAction private func close() {
        dismiss(animated: true)
    }
    
}
