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
                //
                for episode in result.results as [Episode]{
                    viewModels.append(EpisodeViewModel(episode: episode))
                }
                self.episodeViewModel = viewModels
                self.tableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .gray6
        self.title = "Episode"

        // Screen setup
        setupPageHeaders()
        setupTableView()

        fetchEpisodes()
    }
    func setupTableView(){
        tableView.backgroundColor = .white
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(EpisodeCell.self, forCellReuseIdentifier: "episodeCell")

        NSLayoutConstraint.activate([tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 110),
                                     tableView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor)])
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 77
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
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailedEpisodeViewController = DetailedEpisodeViewController()
        detailedEpisodeViewController.episodeViewModel = self.episodeViewModel[indexPath.row]
        self.navigationController?.pushViewController(detailedEpisodeViewController, animated: true)
    }


    func setupPageHeaders(){

        //Page title
        let episodeTitlePage = UILabel()
        episodeTitlePage.text = "Episode"
        episodeTitlePage.textAlignment = .left
        episodeTitlePage.font = UIFont.boldSystemFont(ofSize: 34)
        episodeTitlePage.textColor = .basicblack
        episodeTitlePage.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(episodeTitlePage)

        let locationTitlePageConstraints = [episodeTitlePage.topAnchor.constraint(equalTo: view.topAnchor, constant: 110),
                                            episodeTitlePage.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, constant: -20),
                                            episodeTitlePage.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 15)]
        NSLayoutConstraint.activate(locationTitlePageConstraints)
    }


}
