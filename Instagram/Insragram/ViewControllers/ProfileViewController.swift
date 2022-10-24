//
//  ProfileViewController.swift
//  Insragram
//
//  Created by Алена Панченко on 23.10.2022.
//

import UIKit

// Экран профиля
final class ProfileViewController: UIViewController {
    
    // MARK: - Private Constants
    private enum Constants {
        static let profileInformationIdentifier = "profileInformation"
        static let profileInformationNibName = "ProfileInformationTableViewCell"
        static let aboutMeIdentifier = "aboutMe"
        static let aboutMeNibName = "AboutMeTableViewCell"
        static let topicalIdentifier = "topical"
        static let topicalNibName = "TopicalTableViewCell"
        static let publicationsIdentifier = "publications"
        static let publicationsNibName = "PublicationsTableViewCell"
        static let publicationCollectionViewIdentifier = "publicatonCell"
        static let publicationCollectionViewNibName = "PublicationsCollectionViewCell"
        
    }
    
    private enum SectionType {
        case profileInformation
        case aboutMe
        case topical
        case publications
    }
    
    // MARK: - Private Properties
    private let sectionTypes: [SectionType] = [.profileInformation, .aboutMe, .topical, .publications]
    
    private let posts: [Topic] = [
        Topic(postImageName: "mi1"),
        Topic(postImageName: "mi2"),
        Topic(postImageName: "mi3"),
        Topic(postImageName: "mi4"),
        Topic(postImageName: "mi5"),
        Topic(postImageName: "mi6"),
        Topic(postImageName: "mi7"),
        Topic(postImageName: "mi8"),
        Topic(postImageName: "mi9"),
        Topic(postImageName: "mi"),
        Topic(postImageName: "mis")
    ]
    
    // MARK: - Private Outlets
    @IBOutlet weak private var profileTableView: UITableView!
    
    // MARK: - LifeCicle
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshControl()
        configureTableView()
    }
    
    // MARK: - Private Actions
    @objc private func refreshControlAction() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.profileTableView.refreshControl?.endRefreshing()
            self.profileTableView.reloadData()
        }
    }
    
    // MARK: - Private Methods
    private func refreshControl() {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refreshControlAction), for: .valueChanged)
        profileTableView.refreshControl = refreshControl
    }
    
    private func configureTableView() {
        profileTableView.dataSource = self
        profileTableView.estimatedRowHeight = UITableView.automaticDimension
        profileTableView.register(UINib(nibName: Constants.profileInformationNibName, bundle: nil),
                                  forCellReuseIdentifier: Constants.profileInformationIdentifier)
        profileTableView.register(UINib(nibName: Constants.aboutMeNibName, bundle: nil),
                                  forCellReuseIdentifier: Constants.aboutMeIdentifier)
        profileTableView.register(UINib(nibName: Constants.topicalNibName, bundle: nil),
                                  forCellReuseIdentifier: Constants.topicalIdentifier)
        profileTableView.register(UINib(nibName: Constants.publicationsNibName, bundle: nil),
                                  forCellReuseIdentifier: Constants.publicationsIdentifier)
    }
    
}

extension ProfileViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        sectionTypes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let type = sectionTypes[indexPath.row]
        switch type {
        case .profileInformation:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.profileInformationIdentifier)
            else { return UITableViewCell() }
            return cell
        case .aboutMe:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.aboutMeIdentifier)
            else { return UITableViewCell() }
            return cell
        case .topical:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.topicalIdentifier)
            else { return UITableViewCell() }
            return cell
        case .publications:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: Constants.publicationsIdentifier
            ) as? PublicationsTableViewCell
                    
            else { return UITableViewCell() }
            cell.collectionView.dataSource = self
            cell.collectionView.delegate = self
            let side = UIScreen.main.bounds.width / 3 - 1
            cell.collectionView.register(
                UINib(nibName: Constants.publicationCollectionViewNibName, bundle: nil),
                forCellWithReuseIdentifier: Constants.publicationCollectionViewIdentifier
            )
            cell.collectionHeigthConstraint.constant = side * CGFloat(12 / 3).rounded(.up)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
}

extension ProfileViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        11
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        let model = posts[indexPath.row]
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: Constants.publicationCollectionViewIdentifier,
            for: indexPath
        ) as? PublicationsCollectionViewCell
        else { return UICollectionViewCell()}
        cell.update(model)
        return cell
    }
}

extension ProfileViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        let side = UIScreen.main.bounds.width / 3 - 1
        return CGSize(width: side, height: side)
    }
}
