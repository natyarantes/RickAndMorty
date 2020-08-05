//
//  CharacterViewController.swift
//  RickAndMorty
//
//  Created by Natália Arantes on 02/08/20.
//  Copyright © 2020 Natália Arantes. All rights reserved.
//

import UIKit
import SDWebImage

class CharacterViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    var api = RickAndMortyAPI()

    var collectionViewVar: UICollectionView?

    var characterViewModel: [CharacterViewModel] = []
    func characterFetch(){
        let requestCharacter = CharacterRequest(offset: 0)
        api.send(apiRequest: requestCharacter) { (result: Result<ResultData<Character>, Error> ) in
            switch result {
            case .success(let result):
                var viewModels = [CharacterViewModel]()
                for character: Character in result.results as [Character]{
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
        self.title = "Character"

        self.view.backgroundColor = .gray6

        //MARK: Filter button
        let filterButton = UIButton()
        filterButton.setTitle("Filter", for: .normal)
        filterButton.setTitleColor(.indigo, for: .normal)
        filterButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        filterButton.contentHorizontalAlignment = .right

        self.view.addSubview(filterButton)

        filterButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([filterButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 90),
                                       filterButton.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, constant: -30)])

        //MARK: Page title
        let characterTitlePage = UILabel()
        characterTitlePage.text = "Character"
        characterTitlePage.textAlignment = .left
        characterTitlePage.font = UIFont.boldSystemFont(ofSize: 34)
        characterTitlePage.textColor = .basicblack
        characterTitlePage.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(characterTitlePage)

        let characterTitlePageConstraints = [characterTitlePage.topAnchor.constraint(equalTo: view.topAnchor, constant: 110),
                                             characterTitlePage.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor)]
        NSLayoutConstraint.activate(characterTitlePageConstraints)

        //MARK: Character collection view
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
                                     myCollectionView.heightAnchor.constraint(equalTo: view.heightAnchor),
                                     myCollectionView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor)])


        collectionViewVar = myCollectionView
        //MARK: Character fetch and show
        characterFetch()


    }

    //MARK: Collection view - characters

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
}
