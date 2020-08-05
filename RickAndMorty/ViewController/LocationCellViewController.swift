//
//  LocationCellViewController.swift
//  RickAndMorty
//
//  Created by Natália Arantes on 05/08/20.
//  Copyright © 2020 Natália Arantes. All rights reserved.
//

import UIKit

class LocationCell: UICollectionViewCell {
    let locationType: UILabel = {
        let locationTypeLabel = UILabel()
        locationTypeLabel.translatesAutoresizingMaskIntoConstraints = false
        locationTypeLabel.text = "Location type"
        locationTypeLabel.textColor = .gray2
        locationTypeLabel.font = UIFont.boldSystemFont(ofSize: 11)
        locationTypeLabel.textAlignment = .left

        return locationTypeLabel
    }()
    let dimension: UILabel = {
        let dimensionLabel = UILabel()
        dimensionLabel.translatesAutoresizingMaskIntoConstraints = false
        dimensionLabel.text = "Location name"
        dimensionLabel.textColor = .basicblack
        dimensionLabel.font = UIFont.boldSystemFont(ofSize: 17)
        dimensionLabel.textAlignment = .left
        dimensionLabel.numberOfLines = 2

        return dimensionLabel
    }()

    override init(frame: CGRect) {
        super.init(frame: .zero)
        contentView.addSubview(locationType)
        contentView.addSubview(dimension)

        NSLayoutConstraint.activate([locationType.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 10),
                                     locationType.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
                                     locationType.widthAnchor.constraint(equalTo: contentView.widthAnchor, constant: -24)])
        NSLayoutConstraint.activate([dimension.topAnchor.constraint(equalTo: locationType.bottomAnchor, constant: 5),
                                     dimension.centerXAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.centerXAnchor),
                                     dimension.widthAnchor.constraint(equalTo: contentView.widthAnchor, constant: -24)])

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) not available")

        
    }
}
