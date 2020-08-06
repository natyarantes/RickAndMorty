//
//  EpisodeCellViewController.swift
//  RickAndMorty
//
//  Created by Natália Arantes on 05/08/20.
//  Copyright © 2020 Natália Arantes. All rights reserved.
//

import UIKit

class EpisodeCell: UITableViewCell {

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
        super.init(style: style, reuseIdentifier: "episodeCell")
        contentView.addSubview(episodeSeason)
        contentView.addSubview(episodeTitle)
        contentView.addSubview(episodeAired)

        NSLayoutConstraint.activate([episodeSeason.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor),
                                     episodeSeason.centerXAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.centerXAnchor),
                                     episodeSeason.widthAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.widthAnchor)])
        NSLayoutConstraint.activate([episodeTitle.topAnchor.constraint(equalTo: episodeSeason.bottomAnchor),
                                     episodeSeason.centerXAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.centerXAnchor),
                                     episodeSeason.widthAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.widthAnchor)])
        NSLayoutConstraint.activate([episodeAired.topAnchor.constraint(equalTo: episodeSeason.bottomAnchor),
                                     episodeAired.centerXAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.centerXAnchor),
                                     episodeAired.widthAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.widthAnchor)])

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) not available")
    }
}
