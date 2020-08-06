//
//  EpisodeViewController.swift
//  RickAndMorty
//
//  Created by Natália Arantes on 02/08/20.
//  Copyright © 2020 Natália Arantes. All rights reserved.
//

import UIKit

class EpisodeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var api = RickAndMortyAPI()
    var episodeViewModel: [EpisodeViewModel] = []

    let tableView = UITableView()

    func fetchEpisodes() {
        let requestEpisodes = EpisodeRequest(offset: 0)
        api.send(apiRequest: requestEpisodes) { (result: Result<ResultData<Episode>, Error>) in
            switch result {
            case .success(let result):
                var viewModels = [EpisodeViewModel]()
                for episode: Episode in result.results as [Episode]{
                    viewModels.append(EpisodeViewModel(episode: episode))
                }
                self.episodeViewModel = viewModels
                self.tableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }

    func setupTableView(){
        tableView.backgroundColor = .white
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "episodeCell")
        NSLayoutConstraint.activate([tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 140),
                                     tableView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, constant: -24)])
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .gray6
        self.title = "Episode"

        setupPageHeaders()
        fetchEpisodes()
        setupTableView()

    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return episodeViewModel.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let episodeCell = tableView.dequeueReusableCell(withIdentifier: "episodeCell", for: indexPath) as? EpisodeCell else {
            return UITableViewCell()
        }

        episodeCell.episodeSeason.text = episodeViewModel[indexPath.row].episodes
        episodeCell.episodeTitle.text = episodeViewModel[indexPath.row].name
        episodeCell.episodeAired.text = episodeViewModel[indexPath.row].airDate

        return episodeCell
    }

    


    func setupPageHeaders(){
        //Filter button
        let filterButton = UIButton()
        filterButton.setTitle("Filter", for: .normal)
        filterButton.setTitleColor(.indigo, for: .normal)
        filterButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        filterButton.contentHorizontalAlignment = .right

        self.view.addSubview(filterButton)

        filterButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([filterButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
                                       filterButton.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, constant: -20)])

        //Page title
        let locationTitlePage = UILabel()
        locationTitlePage.text = "Episode"
        locationTitlePage.textAlignment = .left
        locationTitlePage.font = UIFont.boldSystemFont(ofSize: 34)
        locationTitlePage.textColor = .basicblack
        locationTitlePage.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(locationTitlePage)

        let locationTitlePageConstraints = [locationTitlePage.topAnchor.constraint(equalTo: view.topAnchor, constant: 110),
                                             locationTitlePage.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, constant: -20)]
        NSLayoutConstraint.activate(locationTitlePageConstraints)
    }


}
