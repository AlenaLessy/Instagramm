//
//  ViewController.swift
//  Insragram
//
//  Created by Алена Панченко on 18.10.2022.
//

import UIKit

/// Экран Home
class InstagamViewController: UIViewController {
    
    // MARK: Private Constants
    private enum Constants {
        static let storiesIdentifyer = "stories"
        static let postIdentifyer = "post"
        static let recommendationsIdentifyer = "recommendations"
    }
    
    // MARK: - Private Outlets
    @IBOutlet weak private var storiesTableView: UITableView!
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        refreshControl()
    }
    
    // MARK: - Private Actions
    @objc private func refreshControlAction() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.storiesTableView.refreshControl?.endRefreshing()
            self.storiesTableView.reloadData()
        }
    }
   
    // Private Methods
    private func refreshControl() {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refreshControlAction), for: .valueChanged)
        storiesTableView.refreshControl = refreshControl
    }
    
    private func configureTableView() {
        storiesTableView.delegate = self
        storiesTableView.dataSource = self
    }
    
}
/// UITableViewDelegate
extension InstagamViewController: UITableViewDelegate {}

/// UITableViewDataSource
extension InstagamViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            return tableView.dequeueReusableCell(withIdentifier: Constants.storiesIdentifyer) ?? UITableViewCell()
        case 1, 3, 4:
            return tableView.dequeueReusableCell(withIdentifier: Constants.postIdentifyer) ?? UITableViewCell()
        case 2: return tableView.dequeueReusableCell(withIdentifier: Constants.recommendationsIdentifyer)
            ?? UITableViewCell()
        default:
            return UITableViewCell()
        }
    }
  
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch indexPath.row {
        case 0: return 130
        case 1, 3, 4: return 600
        case 2: return 300
        default: return 100
        }
    }
}
