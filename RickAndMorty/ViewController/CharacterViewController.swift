//
//  CharacterViewController.swift
//  RickAndMorty
//
//  Created by Natália Arantes on 02/08/20.
//  Copyright © 2020 Natália Arantes. All rights reserved.
//

import UIKit

class CharacterViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

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


        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 16, right: 16)
        layout.itemSize = CGSize(width: 180, height: 219)

        let myCollectionView:UICollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
//        myCollectionView.
        myCollectionView.dataSource = self
        myCollectionView.delegate = self
        myCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "My cell")
        myCollectionView.backgroundColor = .white
        self.view.addSubview(myCollectionView)





    }

    //MARK: Collection view - characters
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "My cell", for: indexPath)
        myCell.backgroundColor = .white
        myCell.layer.borderWidth = 1
        myCell.layer.borderColor = UIColor.gray5.cgColor
        myCell.layer.cornerRadius = 10

        return myCell
    }
}
