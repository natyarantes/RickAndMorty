//
//  CharacterCellViewController.swift
//  RickAndMorty
//
//  Created by Natália Arantes on 03/08/20.
//  Copyright © 2020 Natália Arantes. All rights reserved.
//

import UIKit

class CharacterCell: UICollectionViewCell {

    let characterProfilePic: UIImageView = {
        let profilePic = UIImageView()
        profilePic.translatesAutoresizingMaskIntoConstraints = false
        profilePic.image = UIImage(named: "profilepic")

        return profilePic
    }()

    let characterStatus: UILabel = {
        let characterStatusLabel = UILabel()
        characterStatusLabel.translatesAutoresizingMaskIntoConstraints = false
        characterStatusLabel.text = "Status"
        characterStatusLabel.textColor = .gray3
        characterStatusLabel.font = UIFont.boldSystemFont(ofSize: 11)
        characterStatusLabel.textAlignment = .left

        return characterStatusLabel
    }()

    let characterName: UILabel = {
        let characterNameLabel = UILabel()
        characterNameLabel.translatesAutoresizingMaskIntoConstraints = false
        characterNameLabel.text = "Nome do personagem"
        characterNameLabel.textColor = .basicblack
        characterNameLabel.font = UIFont.boldSystemFont(ofSize: 17)
        characterNameLabel.textAlignment = .left

        return characterNameLabel
    }()


    override init(frame: CGRect) {
        super.init(frame: .zero)
        contentView.addSubview(characterProfilePic)
        contentView.layer.cornerRadius = 10
        contentView.clipsToBounds = true

        NSLayoutConstraint.activate([characterProfilePic.topAnchor.constraint(equalTo: contentView.topAnchor),
                                     characterProfilePic.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
                                     characterProfilePic.heightAnchor.constraint(equalToConstant: 140),
                                     characterProfilePic.widthAnchor.constraint(equalToConstant: 160)])

        contentView.addSubview(characterStatus)
        NSLayoutConstraint.activate([characterStatus.topAnchor.constraint(equalTo: characterProfilePic.bottomAnchor, constant: 12),
                                     characterStatus.widthAnchor.constraint(equalTo: contentView.widthAnchor, constant: -24),
            characterStatus.centerXAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.centerXAnchor)])

        contentView.addSubview(characterName)
        NSLayoutConstraint.activate([characterName.topAnchor.constraint(equalTo: characterStatus.bottomAnchor, constant: 2),
                                     characterName.widthAnchor.constraint(equalTo: contentView.widthAnchor, constant: -24),
                                     characterName.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)])


    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) not available")
    }
}
