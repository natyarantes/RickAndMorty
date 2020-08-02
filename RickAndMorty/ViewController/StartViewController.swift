//
//  StartViewController.swift
//  RickAndMorty
//
//  Created by Natália Arantes on 31/07/20.
//  Copyright © 2020 Natália Arantes. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent // .default
    }
    
    //pixelwolf logo component creation
    var pwImageView: UIImageView = {
        let pixelwolf = UIImage(named: "pixelwolf")
        let pwImageView = UIImageView(image: pixelwolf)
        pwImageView.translatesAutoresizingMaskIntoConstraints = false
        
        return pwImageView
    }()
    
    func setupPwImageView() {
        view.addSubview(pwImageView)
        buildConstraintsPwImageView()
    }
    
    func buildConstraintsPwImageView() {
        let constraints = [pwImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
                           pwImageView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor)]
        NSLayoutConstraint.activate(constraints)
    }

    //rick and morty logo component creation
    var ramImageView: UIImageView = {
        let rickandmorty = UIImage(named: "RickAndMorty")
        let ramImageView = UIImageView(image: rickandmorty)
        ramImageView.translatesAutoresizingMaskIntoConstraints = false

        return ramImageView
    }()

    func setupRaMImageView() {
        view.addSubview(ramImageView)
        buildConstraintsRaMImageView()
    }

    func buildConstraintsRaMImageView() {
        let constraints = [ramImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 170),
                           ramImageView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor)]
        NSLayoutConstraint.activate(constraints)
    }

    //welcome title component creation

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .basicblack

        //pixelwolf logo
        setupPwImageView()

        //Rick and Morty logo
        setupRaMImageView()


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
        instructButton.setTitleColor(.adding, for: .normal)
        instructButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        instructButton.layer.borderWidth = 3
        instructButton.layer.borderColor = UIColor.adding.cgColor
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
        prototypeButton.setTitleColor(.basicblack, for: .normal)
        prototypeButton.backgroundColor = .adding
        prototypeButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
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
        rickandmortytab.modalPresentationStyle = .fullScreen
        self.present(rickandmortytab, animated: true, completion: nil)
    }
}
