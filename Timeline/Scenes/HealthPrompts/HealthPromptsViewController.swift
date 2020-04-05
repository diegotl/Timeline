//
//  HealthPromptsViewController.swift
//  Timeline
//
//  Created by Diego Trevisan Lara on 05.04.20.
//  Copyright © 2020 Diego Trevisan Lara. All rights reserved.
//

import UIKit

class HealthPromptsViewController: UIViewController, IHealthPromptsView {
    
    var configurator: IHealthPromptsConfigurator!
    var presenter: IHealthPromptsPresenter!
    
    @IBOutlet private weak var loadingView: UIActivityIndicatorView!
    @IBOutlet private weak var statusLabel: UILabel!
    @IBOutlet private weak var retryButton: UIButton!
    @IBOutlet private weak var cardView: CardView!
    
    // MARK: - View
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(self)
        
        setupUI()
        presenter.listHealthPrompts()
    }
    
    private func setupUI() {
        set(loading: false)
        update(status: nil)
        toggleRetryButton(show: false)
    }
    
    // MARK: - Actions
    
    @IBAction private func retry() {
        presenter.listHealthPrompts()
    }
    
    // MARK: - IHealthPromptsView
    
    func set(loading: Bool) {
        if loading {
            loadingView.startAnimating()
        } else {
            loadingView.stopAnimating()
        }
    }
    
    func update(status: String?) {
        statusLabel.text = status
    }
    
    func toggleRetryButton(show: Bool) {
        retryButton.isHidden = !show
    }
    
    func update(healthPrompt: HealthPrompt) {
        cardView.isHidden = false
        cardView.healthPrompt = healthPrompt
    }
    
}

class CardView: UIView {
    
    @IBOutlet private weak var textLabel: UILabel!
    
    var healthPrompt: HealthPrompt? {
        didSet {
            textLabel.text = healthPrompt?.message
        }
    }
    
}
