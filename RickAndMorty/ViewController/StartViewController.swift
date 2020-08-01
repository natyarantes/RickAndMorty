//
//  StartViewController.swift
//  RickAndMorty
//
//  Created by Natália Arantes on 31/07/20.
//  Copyright © 2020 Natália Arantes. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.init(named: "Basic Black")

        //pixelwolf logo
        let pixelwolf = UIImage(named: "pixelwolf")
        let pwImageView:UIImageView = UIImageView()
        pwImageView.center = self.view.center


        pwImageView.image = pixelwolf
        self.view.addSubview(pwImageView)

        pwImageView.translatesAutoresizingMaskIntoConstraints = false
        pwImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        pwImageView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
//        pwImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true


        //Rick and Morty logo
        let rickandmorty = UIImage(named:"RickAndMorty")
        let ramImageView: UIImageView = UIImageView()
        ramImageView.center = self.view.center

        ramImageView.image = rickandmorty
        self.view.addSubview(ramImageView)

        ramImageView.translatesAutoresizingMaskIntoConstraints = false
        ramImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 170).isActive = true
        ramImageView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true

        //Text welcome title
        let welcomeLabel = UITextField()
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        welcomeLabel.text = "Welcome"
        welcomeLabel.textAlignment = .center
        welcomeLabel.textColor = .white
        welcomeLabel.font = UIFont.boldSystemFont(ofSize: 22)

        self.view.addSubview(welcomeLabel)

        welcomeLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 320).isActive = true
        welcomeLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true

        //Text welcome
        let wlcmText = UILabel()
        wlcmText.translatesAutoresizingMaskIntoConstraints = false
        wlcmText.text = "In this test, we will assess your ability to build the application through code analysis and reproduction of the following layout."
        wlcmText.textAlignment = .center
        wlcmText.textColor = .white
        wlcmText.font.withSize(17)
        wlcmText.numberOfLines = 0

        self.view.addSubview(wlcmText)

        wlcmText.topAnchor.constraint(equalTo: view.topAnchor, constant: 350).isActive = true
        wlcmText.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        wlcmText.widthAnchor.constraint(equalTo:view.safeAreaLayoutGuide.widthAnchor, constant: -40).isActive = true



        //instructions button
        let instructButton = UIButton(type: .custom)
        instructButton.setTitle("🔗 GET THE INSTRUCTIONS", for: .normal)
        instructButton.setTitleColor(UIColor.init(named: "Adding"), for: .normal)
        instructButton.layer.borderWidth = 3
        instructButton.layer.borderColor = UIColor.white.cgColor
        instructButton.layer.cornerRadius = 10
        instructButton.contentEdgeInsets = UIEdgeInsets(top: 20, left: 0, bottom: 20, right: 0)


        self.view.addSubview(instructButton)

        instructButton.translatesAutoresizingMaskIntoConstraints = false
        instructButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -150).isActive = true
        instructButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        instructButton.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, constant: -40).isActive = true



        //start prototype button
        let prototypeButton = UIButton(type: .custom)
        prototypeButton.setTitle("START PROTOTYPE", for: .normal)
        prototypeButton.setTitleColor(UIColor.init(named: "Basic Black"), for: .normal)
        prototypeButton.backgroundColor = UIColor.init(named: "Adding")
        prototypeButton.layer.cornerRadius = 10
        prototypeButton.contentEdgeInsets = UIEdgeInsets(top: 20, left: 0, bottom: 20, right: 0)

        prototypeButton.addTarget(self, action: #selector(startPrototype), for: .touchUpInside)

        self.view.addSubview(prototypeButton)

        prototypeButton.translatesAutoresizingMaskIntoConstraints = false
        prototypeButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -75).isActive = true
        prototypeButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        prototypeButton.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, constant: -40).isActive = true

    }

    @objc func startPrototype() {
        let rickandmortytab = RickAndMortyTabBarController()
        self.present(rickandmortytab, animated: true, completion: nil)
    }
}
