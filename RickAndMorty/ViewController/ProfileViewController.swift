//
//  ProfileViewController.swift
//  RickAndMorty
//
//  Created by Natália Arantes on 06/08/20.
//  Copyright © 2020 Natália Arantes. All rights reserved.
//

import UIKit
import SDWebImage

class ProfileViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var characterViewModel: CharacterViewModel?
    var locationViewModel: LocationViewModel?
    let informationTableView = UITableView()

    func setHeader() {

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
        profilePicView.frame.size.width = 130
        profilePicView.frame.size.height = 130
        profilePicView.layer.cornerRadius = 80
        profilePicView.clipsToBounds = true
        profilePicView.translatesAutoresizingMaskIntoConstraints = false

        characterBg.addSubview(profilePicView)
        NSLayoutConstraint.activate([profilePicView.topAnchor.constraint(equalTo: characterBg.topAnchor, constant: 20),
                                     profilePicView.centerXAnchor.constraint(equalTo: characterBg.centerXAnchor)])


        //        Status
        let characterStatus = UILabel()
        characterStatus.text = characterViewModel?.status
        characterStatus.textAlignment = .center
        characterStatus.textColor = .gray2
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

    func setupInformationsTableView() {
        informationTableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(informationTableView)
        informationTableView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([informationTableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 400),
                                     informationTableView.widthAnchor.constraint(equalTo: view.widthAnchor),
                                     informationTableView.heightAnchor.constraint(equalTo: view.heightAnchor)])
        informationTableView.register(ProfileCell.self, forCellReuseIdentifier: "characterInfoCell")
        informationTableView.delegate = self
        informationTableView.dataSource = self
    }

    var infoRequired = ["Gender", "Origin", "Type", "Location"]

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.view.backgroundColor = .gray6

        setHeader()

        setupInformationsTableView()

    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 77
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return infoRequired.count
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        //Section information
        let headerInfoView = UIView()
        let headerInfoCell = tableView.dequeueReusableCell(withIdentifier: "characterInfoCell") as! ProfileCell
        let headerInfoLabel = UILabel()
        headerInfoLabel.text = "Information"
        headerInfoLabel.textAlignment = .left
        headerInfoLabel.textColor = .gray1
        headerInfoLabel.font = UIFont.boldSystemFont(ofSize: 20)
        headerInfoLabel.translatesAutoresizingMaskIntoConstraints = false

        headerInfoView.addSubview(headerInfoCell)
        headerInfoView.addSubview(headerInfoLabel)

        NSLayoutConstraint.activate([headerInfoLabel.topAnchor.constraint(equalTo: headerInfoView.topAnchor),
                                     headerInfoLabel.widthAnchor.constraint(equalTo: headerInfoView.widthAnchor),
                                     headerInfoLabel.centerYAnchor.constraint(equalTo: headerInfoView.centerYAnchor),
                                     headerInfoLabel.centerXAnchor.constraint(equalTo: headerInfoView.centerXAnchor, constant: 20)])

        //Section Episodes
        let headerEpisodeView = UIView()
        let headerEpisodeCell = tableView.dequeueReusableCell(withIdentifier: "characterInfoCell") as! ProfileCell
        let headerEpisodeLabel = UILabel()
        headerEpisodeLabel.text = "Information"
        headerEpisodeLabel.textAlignment = .left
        headerEpisodeLabel.textColor = .gray1
        headerEpisodeLabel.font = UIFont.boldSystemFont(ofSize: 20)
        headerEpisodeLabel.translatesAutoresizingMaskIntoConstraints = false

        headerEpisodeView.addSubview(headerEpisodeCell)
        headerEpisodeView.addSubview(headerEpisodeLabel)

        NSLayoutConstraint.activate([headerEpisodeLabel.topAnchor.constraint(equalTo: headerEpisodeView.topAnchor),
                                     headerEpisodeLabel.widthAnchor.constraint(equalTo: headerEpisodeView.widthAnchor),
                                     headerEpisodeLabel.centerYAnchor.constraint(equalTo: headerEpisodeView.centerYAnchor),
                                     headerEpisodeLabel.centerXAnchor.constraint(equalTo: headerEpisodeView.centerXAnchor, constant: 20)])


        switch section {
        case 0: return headerInfoView
        case 1: return headerEpisodeView
        default: return nil
        }
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        77
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let characterInfoCell = informationTableView.dequeueReusableCell(withIdentifier: "characterInfoCell", for: indexPath) as? ProfileCell else {
            return UITableViewCell()
        }

        characterInfoCell.title.text = infoRequired[indexPath.row]

        let infoIndex = indexPath.row
        switch infoIndex {
        case 0:
            characterInfoCell.subtitle.text = characterViewModel?.gender
        case 1:
            characterInfoCell.subtitle.text = characterViewModel?.origin
        case 2:
            characterInfoCell.subtitle.text = characterViewModel?.typeSpecies
        case 3:
            characterInfoCell.subtitle.text = characterViewModel?.location
        default:
            characterInfoCell.subtitle.text = "Not available"
        }

        return characterInfoCell
    }
    
}
