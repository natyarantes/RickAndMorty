//
//  EpisodeViewController.swift
//  RickAndMorty
//
//  Created by Natália Arantes on 02/08/20.
//  Copyright © 2020 Natália Arantes. All rights reserved.
//

import UIKit

class EpisodeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .gray6
        self.title = "Episode"

        //MARK: Filter button
        let filterButton = UIButton()
        filterButton.setTitle("Filter", for: .normal)
        filterButton.setTitleColor(.indigo, for: .normal)
        filterButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        filterButton.contentHorizontalAlignment = .right

        self.view.addSubview(filterButton)

        filterButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([filterButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
                                       filterButton.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, constant: -20)])

        //MARK: Page title
        let locationTitlePage = UILabel()
        locationTitlePage.text = "Episode"
        locationTitlePage.textAlignment = .left
        locationTitlePage.font = UIFont.boldSystemFont(ofSize: 34)
        locationTitlePage.textColor = .basicblack
        locationTitlePage.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(locationTitlePage)

        let locationTitlePageConstraints = [locationTitlePage.topAnchor.constraint(equalTo: view.topAnchor, constant: 110),
                                             locationTitlePage.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, constant: -20)]
        NSLayoutConstraint.activate(locationTitlePageConstraints)
    }
}
