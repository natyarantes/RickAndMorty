//
//  FilterNameViewController.swift
//  RickAndMorty
//
//  Created by Vinicius Custodio on 09/08/20.
//  Copyright © 2020 Natália Arantes. All rights reserved.
//

import UIKit

protocol FilterSearchDelegate: class {
    func didFinished(_ search: String?, _ associatedSection: Int)
}

class FilterNameViewController: UIViewController {

    weak var delegate:FilterSearchDelegate?
    var section: Int?
    
    lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()

        searchBar.delegate = self
        searchBar.translatesAutoresizingMaskIntoConstraints = false

        return searchBar
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        view.addSubview(searchBar)
        buildConstraintsSearchBar()
    }

    func buildConstraintsSearchBar() {
        let constraints = [searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                           searchBar.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor),
                           searchBar.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor)]

        NSLayoutConstraint.activate(constraints)
    }

}

extension FilterNameViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        delegate?.didFinished(searchBar.text, section!)
        navigationController?.popToRootViewController(animated: true)
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        delegate?.didFinished(nil, section!)
        navigationController?.popToRootViewController(animated: true)
    }
}
