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

    let episodeSeason: UILabel = {
        let episodeSeasonLabel = UILabel()
        episodeSeasonLabel.translatesAutoresizingMaskIntoConstraints = false
        episodeSeasonLabel.textColor = .basicblack
        episodeSeasonLabel.font = UIFont.boldSystemFont(ofSize: 17)
        episodeSeasonLabel.textAlignment = .left

        return episodeSeasonLabel
    }()

    let episodeTitle: UILabel = {
        let episodeTitleLabel = UILabel()
        episodeTitleLabel.textColor = .gray2
        episodeTitleLabel.font.withSize(15)
        episodeTitleLabel.textAlignment = .left
        episodeTitleLabel.translatesAutoresizingMaskIntoConstraints = false

        return episodeTitleLabel
    }()

    let episodeAired: UILabel = {
        let episodeAiredLabel = UILabel()
        episodeAiredLabel.textColor = .gray1
        episodeAiredLabel.font.withSize(11)
        episodeAiredLabel.text = episodeAiredLabel.text?.uppercased()
        episodeAiredLabel.textAlignment = .left
        episodeAiredLabel.translatesAutoresizingMaskIntoConstraints = false

        return episodeAiredLabel
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

        //Episodes:
        contentView.addSubview(episodeSeason)
        contentView.addSubview(episodeTitle)
        contentView.addSubview(episodeAired)

        NSLayoutConstraint.activate([episodeSeason.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
                                     episodeSeason.widthAnchor.constraint(equalTo: contentView.widthAnchor),
                                     episodeSeason.leftAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leftAnchor, constant: 15)])

        NSLayoutConstraint.activate([episodeTitle.topAnchor.constraint(equalTo: episodeSeason.bottomAnchor, constant: 3),
                                     episodeSeason.widthAnchor.constraint(equalTo: contentView.widthAnchor),
                                     episodeTitle.leftAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leftAnchor, constant: 15)])

        NSLayoutConstraint.activate([episodeAired.topAnchor.constraint(equalTo: episodeSeason.bottomAnchor, constant: 25),
                                     episodeAired.widthAnchor.constraint(equalTo: contentView.widthAnchor),
        episodeAired.leftAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leftAnchor, constant: 15)])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) not available")
    }
}
