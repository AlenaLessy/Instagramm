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
    
    private enum TableCellTypes {
        case stories
        case firstPost
        case posts
        case recommendations
    }
    
    // MARK: - Private Outlets
    @IBOutlet weak private var storiesTableView: UITableView!
    
    // MARK: - Private Properties
    
  private let tableCellTypes: [TableCellTypes] = [.stories, .firstPost, .recommendations, .posts]
    
    private var userPostModel: [UserPostModel] = [
        UserPostModel(userPhotoImageName: "Ellipse 12",
                      userNickName: "Молочник",
                      userImageName: "korova",
                      userPost: "Моя дорогая корова"),
    UserPostModel(userPhotoImageName: "Gubka_Kidsomnibus",
                  userNickName: "Спанч-боб",
                  userImageName: "Gubka_Kidsomnibus",
                  userPost: "Моя любимая фотография"),
        UserPostModel(userPhotoImageName: "gomer",
                      userNickName: "Гомер Симпсон",
                      userImageName: "gomer",
                      userPost: "Это я!")
    ]
    
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
        storiesTableView.dataSource = self
        storiesTableView.estimatedRowHeight = UITableView.automaticDimension
        storiesTableView.register(UINib(nibName: "PostTableViewCell", bundle: nil), forCellReuseIdentifier: "test")
    }
    
}

/// UITableViewDataSource
extension InstagamViewController: UITableViewDataSource {
    
    // возвращает количество секций
    func numberOfSections(in tableView: UITableView) -> Int {
        tableCellTypes.count
    }
    
    // возвращает количество ячеек в секции
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let type = tableCellTypes[section]
        switch type {
        case .stories:
            return 1
        case .firstPost:
            return 1
        case .recommendations:
            return 1
        case .posts:
            return 3
        }
    }
    /// задаю каждую ячейку для секции и номера ячейки дай мне ячейку для первой секции и первой ячейки например
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let type = tableCellTypes[indexPath.section]
        switch type {
        case .stories:
            return tableView.dequeueReusableCell(withIdentifier: Constants.storiesIdentifyer) ?? UITableViewCell()
        case .firstPost:
            let model = userPostModel[indexPath.row]
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "test")
                    as? PostTableViewCell else { return UITableViewCell() }
            cell.update(model)
            return cell
        case .recommendations:
            return tableView.dequeueReusableCell(withIdentifier: Constants.recommendationsIdentifyer)
            ?? UITableViewCell()
        case .posts:
            let model = userPostModel[indexPath.row]
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "test")
                    as? PostTableViewCell else { return UITableViewCell() }
            cell.update(model)
            return cell
        }
    }

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
}
