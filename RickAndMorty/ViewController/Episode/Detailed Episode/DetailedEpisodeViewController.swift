//
//  DetailedEpisodeViewController.swift
//  RickAndMorty
//
//  Created by Natália Arantes on 09/08/20.
//  Copyright © 2020 Natália Arantes. All rights reserved.
//

import UIKit

class DetailedEpisodeViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    var episodeViewModel: EpisodeViewModel?
    var characterViewModel: [CharacterViewModel] = []
    var collectionViewVar: UICollectionView?

    var api = RickAndMortyAPI()

    func getCharacterId(characters: [URL]) -> [String] {
        var characterIds: [String] = []
        for character in characters {
            let id = character.lastPathComponent
            characterIds.append(id)
        }
        print(characterIds)
        return characterIds
    }

    func characterFetch(characterIds: [String]){
        let requestCharacter = CharacterRequestById(offset: 0, ids: characterIds)
        api.send(apiRequest: requestCharacter) { (result: Result<Array<Character>, Error> ) in
            switch result {
            case .success(let result):
                var viewModels = [CharacterViewModel]()
                for character: Character in result as [Character]{
                    viewModels.append(CharacterViewModel(character: character))
                }
                self.characterViewModel = viewModels
                self.collectionViewVar?.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .gray6

        let characterIds = getCharacterId(characters: (episodeViewModel?.characters)!)
        characterFetch(characterIds: characterIds)

        //Up title
        let locationName = UILabel()
        locationName.text = episodeViewModel?.name
        locationName.textAlignment = .center
        locationName.textColor = .basicblack
        locationName.font = UIFont.boldSystemFont(ofSize: 15)
        locationName.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(locationName)
        NSLayoutConstraint.activate([locationName.widthAnchor.constraint(equalTo: view.widthAnchor),
                                     locationName.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                     locationName.topAnchor.constraint(equalTo: view.topAnchor, constant: 60)])

        //Type
        let typeLocation = UILabel()
        typeLocation.text = episodeViewModel?.airDate
        typeLocation.textAlignment = .center
        typeLocation.textColor = .gray3
        typeLocation.font.withSize(11)
        typeLocation.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(typeLocation)
        NSLayoutConstraint.activate([typeLocation.topAnchor.constraint(equalTo: locationName.bottomAnchor, constant: 20),
                                     typeLocation.widthAnchor.constraint(equalTo: view.widthAnchor),
                                     typeLocation.centerXAnchor.constraint(equalTo: view.centerXAnchor)])

        //Title
        let locationTitle = UILabel()
        locationTitle.text = episodeViewModel?.name
        locationTitle.textAlignment = .center
        locationTitle.textColor = .basicblack
        locationTitle.font = UIFont.boldSystemFont(ofSize: 28)
        locationTitle.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(locationTitle)
        NSLayoutConstraint.activate([locationTitle.topAnchor.constraint(equalTo: typeLocation.bottomAnchor, constant: 3),
                                     locationTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                     locationTitle.widthAnchor.constraint(equalTo: view.widthAnchor)])

        //Dimension
        let dimensionLabel = UILabel()
        dimensionLabel.text = episodeViewModel?.episodes
        dimensionLabel.textAlignment = .center
        dimensionLabel.textColor = .gray2
        dimensionLabel.font.withSize(13)
        dimensionLabel.text = dimensionLabel.text?.uppercased()
        dimensionLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(dimensionLabel)
        NSLayoutConstraint.activate([dimensionLabel.topAnchor.constraint(equalTo: locationTitle.bottomAnchor, constant: 3),
                                     dimensionLabel.widthAnchor.constraint(equalTo: view.widthAnchor),
                                     dimensionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)])

        //Characters on episode
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        layout.itemSize = CGSize(width: 160, height: 219)


        let myCollectionView:UICollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        myCollectionView.dataSource = self
        myCollectionView.delegate = self
        myCollectionView.register(CharacterCell.self, forCellWithReuseIdentifier: "My cell")
        myCollectionView.backgroundColor = .white
        self.view.addSubview(myCollectionView)
        myCollectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([myCollectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 160),
                                     myCollectionView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
                                     myCollectionView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor),
                                     myCollectionView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor),
                                     myCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30)])


        collectionViewVar = myCollectionView

    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return characterViewModel.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "My cell", for: indexPath) as? CharacterCell else {
            return UICollectionViewCell()
        }
        myCell.backgroundColor = .white
        myCell.layer.borderWidth = 1
        myCell.layer.borderColor = UIColor.gray5.cgColor
        myCell.layer.cornerRadius = 10

        myCell.characterStatus.text = characterViewModel[indexPath.row].status
        myCell.characterName.text = characterViewModel[indexPath.row].name


        myCell.characterProfilePic.sd_setImage(with: characterViewModel[indexPath.row].image, placeholderImage: UIImage(named: "profilepic"))




        return myCell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let profileViewController = ProfileViewController()
        profileViewController.characterViewModel = self.characterViewModel[indexPath.row]
        self.navigationController?.pushViewController(profileViewController, animated: true)
    }
}
