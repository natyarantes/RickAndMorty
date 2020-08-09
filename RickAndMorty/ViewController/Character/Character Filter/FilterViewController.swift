//
//  FilterViewController.swift
//  RickAndMorty
//
//  Created by Natália Arantes on 06/08/20.
//  Copyright © 2020 Natália Arantes. All rights reserved.
//

import UIKit

class FilterViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {

    let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        let pageTitle = setTitle(title: "Filter")
        NSLayoutConstraint.activate([pageTitle.topAnchor.constraint(equalTo: view.topAnchor, constant: 15),
                                     pageTitle.widthAnchor.constraint(equalTo: view.widthAnchor),
                                     pageTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                     tableView.topAnchor.constraint(equalTo: pageTitle.bottomAnchor, constant: 20),
                                     tableView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                     tableView.widthAnchor.constraint(equalTo: view.widthAnchor)])

    }

    func setTitle (title: String) -> UILabel {
        let titleLabel = UILabel()
        titleLabel.text = title
        titleLabel.textColor = .basicblack
        titleLabel.font = UIFont.boldSystemFont(ofSize: 17)
        titleLabel.textAlignment = .center
        titleLabel.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(titleLabel)

        return titleLabel
    }

    func setupTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(FilterCell.self, forCellReuseIdentifier: "filterCell")

    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        77
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let filterCell = tableView.dequeueReusableCell(withIdentifier: "filterCell", for: indexPath) as? FilterCell else {
            return UITableViewCell()
        }

        return filterCell
    }
}
