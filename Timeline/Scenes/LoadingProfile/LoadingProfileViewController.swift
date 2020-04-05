//
//  LoadingProfileViewController.swift
//  Timeline
//
//  Created by Diego Trevisan Lara on 05.04.20.
//  Copyright © 2020 Diego Trevisan Lara. All rights reserved.
//

import UIKit

class LoadingProfileViewController: UIViewController, ILoadingProfileView {
    
    var configurator: ILoadingProfileConfigurator! = LoadingProfileConfigurator()
    var presenter: ILoadingProfilePresenter!
    
    @IBOutlet private weak var loadingView: UIActivityIndicatorView!
    @IBOutlet private weak var statusLabel: UILabel!
    @IBOutlet private weak var retryButton: UIButton!
    
    // MARK: - View
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(self)
        
        setupUI()
        presenter.loadProfile()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    private func setupUI() {
        set(loading: false)
        update(status: nil)
        toggleRetryButton(show: false)
    }
    
    // MARK: - Actions
    
    @IBAction private func retry() {
        presenter.loadProfile()
    }
    
    // MARK: - ILoadingProfileView
    
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
    
}
