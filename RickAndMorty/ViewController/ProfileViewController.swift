//
//  ProfileViewController.swift
//  RickAndMorty
//
//  Created by Natália Arantes on 06/08/20.
//  Copyright © 2020 Natália Arantes. All rights reserved.
//

import UIKit
import SDWebImage

class ProfileViewController: UIViewController {

    var characterViewModel: CharacterViewModel?
    var locationViewModel: LocationViewModel?

    func fecthCharacterLocationImage() {

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .gray6

        //MARK: Page header

//        Title
        let characterNameLabel = UILabel()
        characterNameLabel.text = characterViewModel?.name
        characterNameLabel.textAlignment = .center
        characterNameLabel.textColor = .basicblack
        characterNameLabel.font = UIFont.boldSystemFont(ofSize: 15)
        characterNameLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(characterNameLabel)
        NSLayoutConstraint.activate([characterNameLabel.widthAnchor.constraint(equalTo: view.widthAnchor),
                                     characterNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                     characterNameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 60)])
//        Background Image
        let imgName = "locationBg.png"
        let bgImage = UIImage(named: imgName)
        let characterBg = UIImageView(image: bgImage)
        characterBg.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(characterBg)
        NSLayoutConstraint.activate([characterBg.topAnchor.constraint(equalTo: characterNameLabel.bottomAnchor, constant: 20),
                                     characterBg.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                     characterBg.widthAnchor.constraint(equalTo: view.widthAnchor   )])

//        Profile image
//        let profileImg = characterViewModel?.image
        let profilePicImage = "profilepic.png"
        let imageProfile = UIImage(named: profilePicImage)
        let profilePicView = UIImageView(image: imageProfile)
        profilePicView.layer.borderWidth = 5
        profilePicView.layer.masksToBounds = false
        profilePicView.layer.borderColor = UIColor.white.cgColor
        profilePicView.layer.cornerRadius = imageProfile!.size.width/2.1
        profilePicView.clipsToBounds = true
        profilePicView.translatesAutoresizingMaskIntoConstraints = false

        characterBg.addSubview(profilePicView)
        NSLayoutConstraint.activate([profilePicView.topAnchor.constraint(equalTo: characterBg.topAnchor, constant: 20),
                                     profilePicView.centerXAnchor.constraint(equalTo: characterBg.centerXAnchor)])


//        Status
        let characterStatus = UILabel()
        characterStatus.text = characterViewModel?.status
        characterStatus.textAlignment = .center
        characterStatus.textColor = .gray3
        characterStatus.font.withSize(11)

        characterStatus.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(characterStatus)

        NSLayoutConstraint.activate([characterStatus.topAnchor.constraint(equalTo: profilePicView.bottomAnchor, constant: 30),
                                     characterStatus.centerXAnchor.constraint(equalTo: view.centerXAnchor)])

//        Character title
        let nameTitle = UILabel()
        nameTitle.text = characterViewModel?.name
        nameTitle.textAlignment = .center
        nameTitle.textColor = .basicblack
        nameTitle.font = UIFont.boldSystemFont(ofSize: 28)
        nameTitle.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(nameTitle)
        NSLayoutConstraint.activate([nameTitle.topAnchor.constraint(equalTo: characterStatus.bottomAnchor, constant: 5),
                                     nameTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor)])

//        Species
        let species = UILabel()
        species.text = characterViewModel?.species
        species.textAlignment = .center
        species.textColor = .gray1
        species.font.withSize(13)
        species.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(species)
        NSLayoutConstraint.activate([species.topAnchor.constraint(equalTo: nameTitle.bottomAnchor, constant: 5),
                                     species.centerXAnchor.constraint(equalTo: view.centerXAnchor)])


    }
    
}
