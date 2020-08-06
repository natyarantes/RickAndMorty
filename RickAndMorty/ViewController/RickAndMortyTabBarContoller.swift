//
//  RickAndMortyTabBarContoller.swift
//  RickAndMorty
//
//  Created by Natália Arantes on 31/07/20.
//  Copyright © 2020 Natália Arantes. All rights reserved.
//

import UIKit

class RickAndMortyTabBarController: UITabBarController, UITabBarControllerDelegate {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .darkContent // .default
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.delegate = self
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        // Create tab character
        let tabCharacter = CharacterViewController()
        let tabCharacterBarItem = UITabBarItem(title: "Character", image: UIImage(named: "character_icon_inactive.png"), selectedImage: UIImage(named: "character_icon_active.png"))

        tabCharacter.tabBarItem = tabCharacterBarItem

        // Create tab location
        let tabLocation = LocationViewController()
        let tabLocationBarItem = UITabBarItem(title: "Location", image: UIImage(named: "location_icon_inactive.png"), selectedImage: UIImage(named: "location_icon_active.png"))

        tabLocation.tabBarItem = tabLocationBarItem

        // Create tab episode
        let tabEpisode = EpisodeViewController()
        let tabEpisodeBarItem = UITabBarItem(title: "Episode", image: UIImage(named: "episodes_icon_inactive.png"), selectedImage: UIImage(named: "episodes_icon_active.png"))

        tabEpisode.tabBarItem = tabEpisodeBarItem

        self.viewControllers = [tabCharacter, tabLocation, tabEpisode]
        
        setupNavigationBar()
    }
    
    func setupNavigationBar() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Filter",
                                                                style: UIBarButtonItem.Style.done,
                                                                target: self, action: #selector(didPressedFilter))
        self.navigationController?.navigationBar.tintColor = .indigo
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 17)]

        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
    }
    
    @objc func didPressedFilter() {
        print("Did pressed filter")
    }

    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        print("Selected \(viewController.title!)")
    }
}
