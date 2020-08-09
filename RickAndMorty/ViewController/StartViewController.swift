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
    
    //Pixelwolf logo component creation
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

    //Rick and morty logo component creation
    func setupRaMImageView() {
        let logoimg = UIImage(named: "RickAndMorty.png") as UIImage?
        let infoButton = UIButton(type: UIButton.ButtonType.custom) as UIButton
        infoButton.setImage(logoimg, for: .normal)
        infoButton.addTarget(self, action: #selector(self.buttonTapped(_:)), for:.touchUpInside)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(slideDownViewTapped))
        containerView.addGestureRecognizer(tapGesture)
        infoButton.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(infoButton)
        NSLayoutConstraint.activate([infoButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 170),
                                     infoButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor)])
    }

    func textWelcomeSetup() {
        let welcomeLabel = UITextField()
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        welcomeLabel.text = "Welcome"
        welcomeLabel.textAlignment = .center
        welcomeLabel.textColor = .white
        welcomeLabel.font = UIFont.boldSystemFont(ofSize: 22)

        self.view.addSubview(welcomeLabel)

        welcomeLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 320).isActive = true
        welcomeLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true

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
    }

    func instructionButtonSetup() {
        let instructButton = UIButton(type: .custom)
        instructButton.setTitle("🔗 GET THE INSTRUCTIONS", for: .normal)
        instructButton.setTitleColor(.adding, for: .normal)
        instructButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        instructButton.layer.borderWidth = 3
        instructButton.layer.borderColor = UIColor.adding.cgColor
        instructButton.layer.cornerRadius = 10
        instructButton.contentEdgeInsets = UIEdgeInsets(top: 20, left: 0, bottom: 20, right: 0)


        self.view.addSubview(instructButton)
        instructButton.addTarget(self, action: #selector(didTapInstructions), for: .touchUpInside)


        instructButton.translatesAutoresizingMaskIntoConstraints = false
        instructButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -150).isActive = true
        instructButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        instructButton.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, constant: -40).isActive = true
    }

    func prototypeButtonSetup() {
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

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .basicblack

        //pixelwolf logo
        setupPwImageView()

        //Rick and Morty logo
        setupRaMImageView()
        let textInfo = UILabel()
        textInfo.text = "Rick and Morty is created by Justin Roiland and Dan Harmon for Adult Swim. The data and images are used without claim of ownership and belong to their respective owners."
        textInfo.textColor = .gray1
        textInfo.font.withSize(17)
        textInfo.textAlignment = .left
        textInfo.numberOfLines = 5
        textInfo.translatesAutoresizingMaskIntoConstraints = false

        slideUpView.addSubview(textInfo)
        NSLayoutConstraint.activate([textInfo.widthAnchor.constraint(equalTo: slideUpView.widthAnchor, constant: -30),
                                     textInfo.centerXAnchor.constraint(equalTo: slideUpView.centerXAnchor),
                                     textInfo.centerYAnchor.constraint(equalTo: slideUpView.centerYAnchor)])


        //Text welcome
        textWelcomeSetup()


        //Instructions button
        instructionButtonSetup()


        //start prototype button
        prototypeButtonSetup()
        
    }

    @objc func didTapInstructions(sender: UIButton) {
        UIApplication.shared.open(URL(string: "https://www.notion.so/Rick-and-Morty-App-iOS-a70d57b3fdb749baae06243f777f3ff0")!, options: [:], completionHandler: nil)
    }
    @objc func startPrototype() {
        let rickandmortytab = RickAndMortyTabBarController()

        let navigationController = UINavigationController(rootViewController: rickandmortytab)
        navigationController.modalPresentationStyle = .fullScreen
        
        self.present(navigationController, animated: true, completion: nil)
    }

    //welcome info
    var containerView = UIView()
    let slideUpViewHeight: CGFloat = 200
    var slideUpView: UIView = {
        let welcomeInfo = UIView()
        welcomeInfo.backgroundColor = .white


        return welcomeInfo
    }()


    @objc func buttonTapped(_ sender: UIButton) {
        let window = self.view
        let screenSize = UIScreen.main.bounds.size
        containerView.backgroundColor = UIColor.black.withAlphaComponent(0.9)
        containerView.frame = self.view.frame

        window?.addSubview(containerView)

        slideUpView.frame = CGRect(x: 10, y: view.frame.size.height, width: screenSize.width, height: slideUpViewHeight)
        window?.addSubview(slideUpView)

        containerView.alpha = 0
        UIView.animate(withDuration: 0.5,
                       delay: 0,
                       options: .curveEaseInOut, animations: {
                        self.containerView.alpha = 0.8
                        self.slideUpView.frame = CGRect(x: 0, y: self.view.frame.size.height - self.slideUpViewHeight, width: screenSize.width, height: self.slideUpViewHeight)
        }, completion: nil)
    }

    //Close floating view
    @objc func slideDownViewTapped() {
        let screenSize = UIScreen.main.bounds.size
        UIView.animate(withDuration: 0.5,
                       delay: 0,
                       options: .curveEaseInOut, animations: {
                        self.containerView.alpha = 0
                        self.slideUpView.frame = CGRect(x: 0, y: screenSize.height, width: screenSize.width, height: self.slideUpViewHeight)
        }, completion: nil)
    }

}
