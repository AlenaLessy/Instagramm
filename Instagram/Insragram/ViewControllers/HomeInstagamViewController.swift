//
//  ViewController.swift
//  Insragram
//
//  Created by Алена Панченко on 18.10.2022.
//

import UIKit

/// Экран Home
final class HomeInstagamViewController: UIViewController {
    
    // MARK: Private Constants
    private enum Constants {
        static let storiesIdentifyer = "stories"
        static let postIdentifyer = "newPost"
        static let recommendationsIdentifyer = "recommendations"
        static let milkmanPhotoImageName = "Ellipse 12"
        static let milkmanNickName = "Молочник"
        static let milkmanImageName = "korova"
        static let milkmanPost = "Моя дорогая корова"
        static let gubkaPhotoImageName = "Gubka_Kidsomnibus"
        static let gubkaNickName = "Спанч-боб"
        static let gubkaImageName = "Gubka_Kidsomnibus"
        static let gubkaPost = "Моя любимая фотография"
        static let gomerPhotoImageName = "gomer"
        static let gomerNickName = "Гомер Симпсон"
        static let gomerImageName = "gomer"
        static let gomerPost = "Это я!"
        static let postNibName = "PostTableViewCell"
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
    
    private var userPost: [UserPost] = [
        UserPost(userPhotoImageName: Constants.milkmanPhotoImageName,
                      userNickName: Constants.milkmanNickName,
                      userImageName: Constants.milkmanImageName,
                      userPost: Constants.milkmanPost),
        UserPost(userPhotoImageName: Constants.gubkaPhotoImageName,
                      userNickName: Constants.gubkaNickName,
                      userImageName: Constants.gubkaImageName,
                      userPost: Constants.gubkaPost),
        UserPost(userPhotoImageName: Constants.gomerPhotoImageName,
                      userNickName: Constants.gomerNickName,
                      userImageName: Constants.gomerImageName,
                      userPost: Constants.gomerPost)
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
    
    // MARK: - Private Methods
    private func refreshControl() {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refreshControlAction), for: .valueChanged)
        storiesTableView.refreshControl = refreshControl
    }
    
    private func configureTableView() {
        storiesTableView.dataSource = self
        storiesTableView.estimatedRowHeight = UITableView.automaticDimension
        storiesTableView.register(UINib(nibName: Constants.postNibName,
                                        bundle: nil),
                                  forCellReuseIdentifier: Constants.postIdentifyer)
    }
    
}

/// UITableViewDataSource
extension HomeInstagamViewController: UITableViewDataSource {
    
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
            let model = userPost[indexPath.row]
            guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.postIdentifyer)
                    as? PostTableViewCell else { return UITableViewCell() }
            cell.update(model)
            return cell
        case .recommendations:
            return tableView.dequeueReusableCell(withIdentifier: Constants.recommendationsIdentifyer)
            ?? UITableViewCell()
        case .posts:
            let model = userPost[indexPath.row]
            guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.postIdentifyer)
                    as? PostTableViewCell else { return UITableViewCell() }
            cell.update(model)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
}
