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

        //create tab character
        let tabCharacter = CharacterViewController()
        let tabCharacterBarItem = UITabBarItem(title: "Character", image: UIImage(named: "character_icon_inactive.png"), selectedImage: UIImage(named: "character_icon_active.png"))

        tabCharacter.tabBarItem = tabCharacterBarItem

        //create tab location
        let tabLocation = LocationViewController()
        let tabLocationBarItem = UITabBarItem(title: "Location", image: UIImage(named: "location_icon_inactive.png"), selectedImage: UIImage(named: "location_icon_active.png"))

        tabLocation.tabBarItem = tabLocationBarItem

        //create tab episode
        let tabEpisode = EpisodeViewController()
        let tabEpisodeBarItem = UITabBarItem(title: "Episode", image: UIImage(named: "episodes_icon_inactive.png"), selectedImage: UIImage(named: "episodes_icon_active.png"))

        tabEpisode.tabBarItem = tabEpisodeBarItem

        self.viewControllers = [tabCharacter, tabLocation, tabEpisode]
    }
    //UITabBarControllerDelegate method
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        print("Selected \(viewController.title!)")
    }
}
