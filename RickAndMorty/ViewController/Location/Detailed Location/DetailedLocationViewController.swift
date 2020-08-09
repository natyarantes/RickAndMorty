//
//  DetailedLocationViewController.swift
//  RickAndMorty
//
//  Created by Natália Arantes on 09/08/20.
//  Copyright © 2020 Natália Arantes. All rights reserved.
//

import UIKit

class DetailedLocationViewController: UIViewController {
    var locationViewModel: LocationViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .gray6

        //Up title
        let locationName = UILabel()
        locationName.text = locationViewModel?.name
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
        typeLocation.text = locationViewModel?.typeLocation
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
        locationTitle.text = locationViewModel?.name
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
        dimensionLabel.text = locationViewModel?.dimension
        dimensionLabel.textAlignment = .center
        dimensionLabel.textColor = .gray2
        dimensionLabel.font.withSize(13)
        dimensionLabel.text = dimensionLabel.text?.uppercased()
        dimensionLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(dimensionLabel)
        NSLayoutConstraint.activate([dimensionLabel.topAnchor.constraint(equalTo: locationTitle.bottomAnchor, constant: 3),
                                     dimensionLabel.widthAnchor.constraint(equalTo: view.widthAnchor),
                                     dimensionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)])

        //Residents collection view


    }
}
