//
//  LikeInstagramViewController.swift
//  Insragram
//
//  Created by Алена Панченко on 20.10.2022.
//

import UIKit

// protocol
protocol LikeInstagramProtocol {}
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
    
    private enum SectionType {
        case announcementsSection
        case todaySection
        case thisWeekSection
        case thisMonthSection
    }
    
    // MARK: - Private Outlets
    @IBOutlet weak private var likeTableView: UITableView!
    
    // MARK: - Private Properties
    private let sectionTypes: [SectionType] = [
        .announcementsSection,
        .todaySection,
        .thisWeekSection,
        .thisMonthSection
    ]
    
    private let todayDataSource: [LikeInstagramProtocol] = [
        LikeStory(userPhotoImageName: "mi1",
                  userNickName: "Potapisch",
                  storyImageName: "m1",
                  time: "3 ч."),
        LikeComment(userPhotoImageName: "mi2",
                    userNickName: "Toptiga59",
                    storyImageName: "m7",
                    comment: "Классный ковер",
                    mentionedUser: "@Potapisch",
                    time: "6 ч."),
        Subscrib(userPhotoImageName: "Rectangle 37", userNick: "formerСow", userName: "Ночка", time: "1 ч."),
    ]
    
    private let thisWeekDataSource: [LikeInstagramProtocol] = [
        
        Subscrib(userPhotoImageName: "korova", userNick: "Burenchik", userName: "Буренка Иванова", time: "2 дн."),
        LikeStory(userPhotoImageName: "Ellipse 12",
                  userNickName: "MilcMan93",
                  storyImageName: "images1",
                  time: "4 дн."),
        NewSubscriber(userPhotoImageName: "images", userNickName: "homkin", time: "5 дн."),
        LikeComment(userPhotoImageName: "gomer",
                    userNickName: "Gomerchick",
                    storyImageName: "m3",
                    comment: "Красотка!",
                    mentionedUser: "AliceStar",
                    time: "6 дн.")
    ]
    
    private let thisMonthDataSource: [LikeInstagramProtocol] = [
        LikeComment(userPhotoImageName: "Gubka_Kidsomnibus",
                    userNickName: "Im_Gubka",
                    storyImageName: "m4",
                    comment: "Отлично выглядишь",
                    mentionedUser: "AliceStar", time: "4 нед."),
        Subscrib(userPhotoImageName: "gomer", userNick: "gomerchik", userName: "Гомер Симпсон", time: "1 нед." ),
        NewSubscriber(userPhotoImageName: "images1", userNickName: "PonyDony", time: "2 нед."),
        LikeStory(userPhotoImageName: "gomer",
                  userNickName: "Gomerchick",
                  storyImageName: "images",
                  time: "1 нед."),
        NewSubscriber(userPhotoImageName: "images3", userNickName: "wolf52", time: "3 нед."),
        Subscrib(userPhotoImageName: "Circle", userNick: "User82355", userName: "Иван Иванов", time: "2 нед.")
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
    // количество секций - массив с типапи секций из энама
    func numberOfSections(in tableView: UITableView) -> Int {
        sectionTypes.count
    }
    // количество ячеек в секциях - это количество значений в массивах секций
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let type = sectionTypes[section]
        switch type {
        case .announcementsSection:
            return 1
        case .todaySection:
            return todayDataSource.count
        case .thisWeekSection:
                return thisWeekDataSource.count
        case .thisMonthSection:
           return thisMonthDataSource.count
        }
    }
    // наполнение номер секции - номер ячейки - что лежит
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 1 - прохожу по всем секциям свичем
        let section = sectionTypes[indexPath.section]
        switch section {
        case .announcementsSection:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.announcementsIdentifyer)
            else { return UITableViewCell() }
            return cell
        case .todaySection:
            let data = todayDataSource[indexPath.row]
            // прохожу свичем по всем возможным типам ячеек
            switch data {
            case let comment as LikeComment:
                let cell = tableView.dequeueReusableCell(withIdentifier: Constants.likeCommentIdentifyer)
                as? LikeCommentTableViewCell
                cell?.update(comment)
                return cell ?? UITableViewCell()
            case let stories as LikeStory:
                let cell = tableView.dequeueReusableCell(withIdentifier: Constants.likeStoryIdentifyer)
                as? LikeStoryTableViewCell
                cell?.update(stories)
                return cell ?? UITableViewCell()
            case let subscrib as Subscrib:
                let cell = tableView.dequeueReusableCell(withIdentifier: Constants.subscribIdentifyer)
                as? SubscribTableViewCell
                cell?.update(subscrib)
                return cell ?? UITableViewCell()
            case let newSubscriber as NewSubscriber:
                let cell = tableView.dequeueReusableCell(withIdentifier: Constants.newSubscriberIdentifyer)
                as? NewSubscriberTableViewCell
                cell?.update(newSubscriber)
                return cell ?? UITableViewCell()
            default:  return UITableViewCell()
            }
        case .thisWeekSection:
            let data = thisWeekDataSource[indexPath.row]
            switch data {
            case let comment as LikeComment:
                let cell = tableView.dequeueReusableCell(withIdentifier: Constants.likeCommentIdentifyer)
                as? LikeCommentTableViewCell
                cell?.update(comment)
                return cell ?? UITableViewCell()
            case let stories as LikeStory:
                let cell = tableView.dequeueReusableCell(withIdentifier: Constants.likeStoryIdentifyer)
                as? LikeStoryTableViewCell
                cell?.update(stories)
                return cell ?? UITableViewCell()
            case let subscrib as Subscrib:
                let cell = tableView.dequeueReusableCell(withIdentifier: Constants.subscribIdentifyer)
                as? SubscribTableViewCell
                cell?.update(subscrib)
                return cell ?? UITableViewCell()
            case let newSubscriber as NewSubscriber:
                let cell = tableView.dequeueReusableCell(withIdentifier: Constants.newSubscriberIdentifyer)
                as? NewSubscriberTableViewCell
                cell?.update(newSubscriber)
                return cell ?? UITableViewCell()
            default:  return UITableViewCell()
            }
        case .thisMonthSection:
            let data = thisMonthDataSource[indexPath.row]
            switch data {
            case let comment as LikeComment:
                let cell = tableView.dequeueReusableCell(withIdentifier: Constants.likeCommentIdentifyer)
                as? LikeCommentTableViewCell
                cell?.update(comment)
                return cell ?? UITableViewCell()
            case let stories as LikeStory:
                let cell = tableView.dequeueReusableCell(withIdentifier: Constants.likeStoryIdentifyer)
                as? LikeStoryTableViewCell
                cell?.update(stories)
                return cell ?? UITableViewCell()
            case let subscrib as Subscrib:
                let cell = tableView.dequeueReusableCell(withIdentifier: Constants.subscribIdentifyer)
                as? SubscribTableViewCell
                cell?.update(subscrib)
                return cell ?? UITableViewCell()
            case let newSubscriber as NewSubscriber:
                let cell = tableView.dequeueReusableCell(withIdentifier: Constants.newSubscriberIdentifyer)
                as? NewSubscriberTableViewCell
                cell?.update(newSubscriber)
                return cell ?? UITableViewCell()
            default:  return UITableViewCell()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch sectionTypes[section] {
        case .announcementsSection:
            return nil
        case .todaySection:
            return  SectionName.todaySectionName
        case .thisWeekSection:
            return SectionName.thisWeekSectionName
        case .thisMonthSection:
            return SectionName.thisMonthSectionName
        }
    }
}
