//
//  ProfileCellViewController.swift
//  RickAndMorty
//
//  Created by Natália Arantes on 08/08/20.
//  Copyright © 2020 Natália Arantes. All rights reserved.
//

import UIKit

class ProfileCell: UITableViewCell {

    let title: UILabel = {
        let titleLabel = UILabel()
        titleLabel.textColor = .basicblack
        titleLabel.textAlignment = .left
        titleLabel.font = UIFont.boldSystemFont(ofSize: 17)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false

        return titleLabel
    }()

    let subtitle: UILabel = {
        let subtitleLabel = UILabel()
        subtitleLabel.textColor = .gray2
        subtitleLabel.textAlignment = .left
        subtitleLabel.font.withSize(15)
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false

        return subtitleLabel
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "characterInfoCell")

        contentView.addSubview(title)
        contentView.addSubview(subtitle)

        NSLayoutConstraint.activate([title.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
                                     title.widthAnchor.constraint(equalTo: contentView.widthAnchor),
                                     title.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20),
                                     subtitle.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 2),
                                     subtitle.widthAnchor.constraint(equalTo: contentView.widthAnchor),
        subtitle.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20)])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) not available")
    }
}
