//
//  LikeInstagramViewController.swift
//  Insragram
//
//  Created by Алена Панченко on 20.10.2022.
//

import UIKit

// Экран уведомлений и лайков
final class LikeInstagramViewController: UIViewController {
    
    // MARK: Private Constants
    private enum Constants {
        static let announcementsIdentifyer = "announcements"
        static let likeStoryIdentifyer = "likeStory"
        static let subscribIdentifyer = "subscrib"
        static let likeCommentIdentifyer = "likeComment"
        static let newSubscriberIdentifyer = "newSubscripter"
        static let announcementsNibName = "AnnouncementsTableViewCell"
        static let likeStoryNibName = "LikeStoryTableViewCell"
        static let subscribNibName = "SubscribTableViewCell"
        static let likeCommentNibName = "LikeCommentTableViewCell"
        static let newSubscriberNibName = "NewSubscriberTableViewCell"
    }
    
    private enum TableCellTypes {
        case announcements
        case likeStory
        case subscrib
        case likeComment
        case newSubscripter
    }
    
    private enum SectionName {
        static let todaySectionName = "Сегодня"
        static let thisWeekSectionName =  "На этой неделе"
        static let thisMonthSectionName = "В этом месяце"
    }
    
    // MARK: - Private Outlets
    @IBOutlet weak private var likeTableView: UITableView!
    
    // MARK: - Private Properties
    
    private let tableCellTypes: [TableCellTypes] = [
        .announcements,
        .likeStory,
        .subscrib,
        .likeComment,
        .newSubscripter
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
            self.likeTableView.refreshControl?.endRefreshing()
            self.likeTableView.reloadData()
        }
    }
    
    // MARK: - Private Methods
    private func refreshControl() {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refreshControlAction), for: .valueChanged)
        likeTableView.refreshControl = refreshControl
    }
    
    private func configureTableView() {
        likeTableView.dataSource = self
        likeTableView.estimatedRowHeight = UITableView.automaticDimension
        likeTableView.register(UINib(nibName: Constants.announcementsNibName, bundle: nil),
                               forCellReuseIdentifier: Constants.announcementsIdentifyer)
        likeTableView.register(UINib(nibName: Constants.likeStoryNibName, bundle: nil),
                               forCellReuseIdentifier: Constants.likeStoryIdentifyer)
        likeTableView.register(UINib(nibName: Constants.subscribNibName, bundle: nil),
                               forCellReuseIdentifier: Constants.subscribIdentifyer)
        likeTableView.register(UINib(nibName: Constants.likeCommentNibName, bundle: nil),
                               forCellReuseIdentifier: Constants.likeCommentIdentifyer)
        likeTableView.register(UINib(nibName: Constants.newSubscriberNibName, bundle: nil),
                               forCellReuseIdentifier: Constants.newSubscriberIdentifyer)
        
    }
    
}

/// UITableViewDataSource
extension LikeInstagramViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let type = tableCellTypes[section]
        switch type {
        case .announcements:
            return 1
        case .likeStory:
            return 2
        case .subscrib:
            return 3
        default: return 1
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let type = tableCellTypes[indexPath.section]
        switch type {
        case .announcements:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.announcementsIdentifyer)
            else { return UITableViewCell() }
            return cell
        case .likeStory:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.likeStoryIdentifyer)
            else { return UITableViewCell() }
            return cell
        case .subscrib:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.subscribIdentifyer)
            else { return UITableViewCell() }
            return cell
        case .likeComment:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.likeCommentIdentifyer)
            else { return UITableViewCell() }
            return cell
        case .newSubscripter:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.newSubscriberIdentifyer)
            else { return UITableViewCell() }
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        switch section {
        case 0:
            return SectionName.todaySectionName
        case 1: return SectionName.thisWeekSectionName
        case 2: return SectionName.thisMonthSectionName
        default:
            return ""
        }
    }
    
}
