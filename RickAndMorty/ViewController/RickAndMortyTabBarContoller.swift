//
//  RickAndMortyTabBarContoller.swift
//  RickAndMorty
//
//  Created by Natália Arantes on 31/07/20.
//  Copyright © 2020 Natália Arantes. All rights reserved.
//

import UIKit

class RickAndMortyTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()

        let vc = ViewController()
        vc.tabBarItem = UITabBarItem(title: "Character", image: UIImage(named: "character_icon_inactive"), selectedImage: UIImage(named: "character_icon_active"))
        
        self.viewControllers = [vc]
    }
}
