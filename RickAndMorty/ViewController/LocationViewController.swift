//
//  LocationViewController.swift
//  RickAndMorty
//
//  Created by Natália Arantes on 02/08/20.
//  Copyright © 2020 Natália Arantes. All rights reserved.
//

import UIKit

class LocationViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    var api = RickAndMortyAPI()
    var collectionViewVar: UICollectionView?

    var locationViewModel: [LocationViewModel] = []
    func locationFetch() {
        let requestLocation = LocationRequest(offset: 0)
        api.send(apiRequest: requestLocation) { (result: Result<ResultData<Location>, Error>) in
            switch result {
            case .success(let result):
                var viewModels = [LocationViewModel]()
                for location: Location in result.results as [Location]{
                    viewModels.append(LocationViewModel(location: location))
                }
                self.locationViewModel = viewModels
                self.collectionViewVar?.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .gray6
        self.title = "Location"

        //MARK: Filter button
        let filterButton = UIButton()
        filterButton.setTitle("Filter", for: .normal)
        filterButton.setTitleColor(.indigo, for: .normal)
        filterButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        filterButton.contentHorizontalAlignment = .right

        self.view.addSubview(filterButton)

        filterButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([filterButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
                                       filterButton.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, constant: -20)])

        //MARK: Page title
        let locationTitlePage = UILabel()
        locationTitlePage.text = "Location"
        locationTitlePage.textAlignment = .left
        locationTitlePage.font = UIFont.boldSystemFont(ofSize: 34)
        locationTitlePage.textColor = .basicblack
        locationTitlePage.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(locationTitlePage)

        let locationTitlePageConstraints = [locationTitlePage.topAnchor.constraint(equalTo: view.topAnchor, constant: 110),
                                             locationTitlePage.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, constant: -20)]
        NSLayoutConstraint.activate(locationTitlePageConstraints)

        //MARK: Location collection view
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        layout.itemSize = CGSize(width: 160, height: 80)


        let myCollectionView:UICollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        myCollectionView.dataSource = self
        myCollectionView.delegate = self
        myCollectionView.register(LocationCell.self, forCellWithReuseIdentifier: "Location cell")
        myCollectionView.backgroundColor = .white
        self.view.addSubview(myCollectionView)
        myCollectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([myCollectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 160),
                                     myCollectionView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
                                     myCollectionView.heightAnchor.constraint(equalTo: view.heightAnchor),
                                     myCollectionView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor)])

        collectionViewVar = myCollectionView
        //MARK: Location fetch and show
        locationFetch()
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return locationViewModel.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let locationCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Location cell", for: indexPath) as? LocationCell else {
            return UICollectionViewCell()
        }
        locationCell.backgroundColor = .white
        locationCell.layer.borderWidth = 1
        locationCell.layer.borderColor = UIColor.gray5.cgColor
        locationCell.layer.cornerRadius = 10

        locationCell.locationType.text = locationViewModel[indexPath.row].typeLocation
        locationCell.dimension.text = locationViewModel[indexPath.row].name

        return locationCell
    }
}
