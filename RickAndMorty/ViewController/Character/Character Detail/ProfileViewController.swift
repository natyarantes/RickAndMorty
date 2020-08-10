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
    var episodeViewModel: [EpisodeViewModel] = []
    let informationTableView = UITableView(frame: CGRect.zero, style: UITableView.Style.grouped)

    var api = RickAndMortyAPI()

    func getEpisodeId(episodes: [URL]) -> [String] {
        var episodeIds: [String] = []
        for episode in episodes {
            let id = episode.lastPathComponent
            episodeIds.append(id)
        }
        return episodeIds
    }

    func episodeFetch(episodeIds: [String]){
        let requestEpisode = EpisodeRequestById(offset: 0, ids: episodeIds)
        api.send(apiRequest: requestEpisode) { (result: Result<Array<Episode>, Error> ) in
            switch result {
            case .success(let result):
                var viewModels = [EpisodeViewModel]()
                for episode: Episode in result as [Episode]{
                    viewModels.append(EpisodeViewModel(episode: episode))
                }
                self.episodeViewModel = viewModels
                self.informationTableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
    let species = UILabel()
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
        let profilePicImage = UIImageView()
        profilePicImage.sd_setImage(with: characterViewModel?.image, placeholderImage: UIImage(named: "profilepic"))

        profilePicImage.layer.borderWidth = 5
        profilePicImage.layer.masksToBounds = false
        profilePicImage.layer.borderColor = UIColor.white.cgColor
        profilePicImage.frame.size = CGSize(width: 130, height: 130)
        profilePicImage.layer.cornerRadius = profilePicImage.frame.size.height/2
        profilePicImage.clipsToBounds = true
        profilePicImage.translatesAutoresizingMaskIntoConstraints = false

        characterBg.addSubview(profilePicImage)
        NSLayoutConstraint.activate([profilePicImage.topAnchor.constraint(equalTo: characterBg.topAnchor, constant: 20),
                                     profilePicImage.centerXAnchor.constraint(equalTo: characterBg.centerXAnchor),
                                     profilePicImage.widthAnchor.constraint(equalToConstant: 130),
                                     profilePicImage.heightAnchor.constraint(equalToConstant: 130)])


        //        Status
        let characterStatus = UILabel()
        characterStatus.text = characterViewModel?.status
        characterStatus.textAlignment = .center
        characterStatus.textColor = .gray2
        characterStatus.font.withSize(11)

        characterStatus.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(characterStatus)

        NSLayoutConstraint.activate([characterStatus.topAnchor.constraint(equalTo: profilePicImage.bottomAnchor, constant: 30),
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
        //Constraints tableView
        NSLayoutConstraint.activate([informationTableView.topAnchor.constraint(equalTo: species.bottomAnchor, constant: 10),
                                     informationTableView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor),
                                     informationTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                                     informationTableView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor)])

        //Populate episode section
        let episodeIds = getEpisodeId(episodes: characterViewModel!.episode)
        episodeFetch(episodeIds: episodeIds)

    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 77
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return infoRequired.count
        case 1:
            return episodeViewModel.count
        default:
            return 4
        }

    }
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        let headerView = UIView()
        headerView.backgroundColor = .white
        let headerCell = tableView.dequeueReusableCell(withIdentifier: "characterInfoCell") as! ProfileCell
        let headerLabel = UILabel()
        headerLabel.textAlignment = .left
        headerLabel.textColor = .gray1
        headerLabel.font = UIFont.boldSystemFont(ofSize: 20)
        headerLabel.translatesAutoresizingMaskIntoConstraints = false

        headerView.addSubview(headerCell)
        headerView.addSubview(headerLabel)

        NSLayoutConstraint.activate([headerLabel.topAnchor.constraint(equalTo: headerView.topAnchor),
                                     headerLabel.widthAnchor.constraint(equalTo: headerView.widthAnchor),
                                     headerLabel.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),
                                     headerLabel.centerXAnchor.constraint(equalTo: headerView.centerXAnchor, constant: 20)])

        if section == 0 {
            headerLabel.text = "Information"
        }
        else {
            headerLabel.text = "Episodes"
        }
        return headerView
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        77
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let characterInfoCell = informationTableView.dequeueReusableCell(withIdentifier: "characterInfoCell", for: indexPath) as? ProfileCell else {
            return UITableViewCell()
        }

        if indexPath.section == 0 {
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
                characterInfoCell.accessoryType = .disclosureIndicator
            default:
                characterInfoCell.subtitle.text = "Not available"
            }
        } else {
            characterInfoCell.episodeSeason.text = episodeViewModel[indexPath.row].episodes
            characterInfoCell.episodeTitle.text = episodeViewModel[indexPath.row].name
            characterInfoCell.episodeAired.text = episodeViewModel[indexPath.row].airDate
        }

        return characterInfoCell
    }
    
}
