//
//  FilterViewController.swift
//  RickAndMorty
//
//  Created by Natália Arantes on 06/08/20.
//  Copyright © 2020 Natália Arantes. All rights reserved.
//

import UIKit

protocol CharacterFilterDelegate: class {
    func didFilter(characterFilter: CharacterFilter)
}

class FilterViewController: UIViewController {

    weak var delegate: CharacterFilterDelegate?
    var selectedIndexPaths = [IndexPath]()
    var characterFilter = CharacterFilter()

    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: CGRect.zero, style: UITableView.Style.grouped)

        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .clear
        tableView.allowsMultipleSelection = true
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 57, bottom: 0, right: 0)
        tableView.tableFooterView = UIView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(FilterCell.self, forCellReuseIdentifier: "filterCell")

        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        self.title = "Filter"

        setupNavigationBar()
        buildTableViewConstraints()
    }

    func setupNavigationBar() {

        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 80, height: 28))

        button.addTarget(self, action: #selector(didApplyFilter), for: .touchUpInside)
        button.setTitle("Apply", for: .normal)
        button.backgroundColor = .indigo
        button.tintColor = .white
        button.layer.cornerRadius = 17

        let applyButton = UIBarButtonItem(customView: button)

        self.navigationItem.rightBarButtonItem = applyButton

        self.navigationController?.navigationBar.tintColor = .indigo
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 17)]
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
    }

    @objc func didApplyFilter() {
        for indexPath in selectedIndexPaths {
            let section = FilterSection(rawValue: indexPath.section)!

            switch section {
            case .gender:
                characterFilter.selectedGender = section.options[indexPath.row]

            case .status:
                characterFilter.selectedStatus = section.options[indexPath.row]

            default:
                print("do nothing")
            }
        }

        delegate?.didFilter(characterFilter: characterFilter)
        self.dismiss(animated: true, completion: nil)
    }

    func buildTableViewConstraints() {
        view.addSubview(tableView)

        let constraints = [tableView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
                           tableView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
                           tableView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor),
                           tableView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor)]

        NSLayoutConstraint.activate(constraints)
        

    }
}

extension FilterViewController: UITableViewDataSource, UITableViewDelegate {

    enum FilterSection: Int, RawRepresentable {
        case info
        case species
        case status
        case gender

        var options: [String] {
            switch self {
            case .status:
                return ["Alive", "Dead", "Unknown"]
            case .gender:
                return ["Female", "Male", "Genderless", "Unknown"]
            case .species, .info:
                return []
            }
        }

        var headerName: String? {
            switch self {
            case .status:
                return "Status"
            case .gender:
                return "Gender"
            default:
                return nil
            }
        }

        var rowCount: Int {
            switch self {
            case .info, .species:
                return 1
            case .status:
                return 3
            case .gender:
                return 4
            }
        }
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 32
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let section = FilterSection(rawValue: section)!

        return createHeader(section)
    }

    func createHeader(_ section: FilterSection) -> UIView {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 32))

        let bottomSeparator = UIView(frame: CGRect(x: 0, y: 32, width: tableView.frame.width, height: 1))
        bottomSeparator.backgroundColor = .gray3

        let label = UILabel(frame: CGRect(x: 10, y: 5, width: headerView.frame.width, height: 27))
        label.text = section.headerName

        headerView.addSubview(bottomSeparator)
        headerView.addSubview(label)

        return headerView
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let section = FilterSection(rawValue: indexPath.section)!

        if section == .info || section == .species {
            return 60
        }

        return 44
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let section = FilterSection(rawValue: section)!
        return section.rowCount
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let filterCell = tableView.dequeueReusableCell(withIdentifier: "filterCell", for: indexPath) as? FilterCell else {
            return UITableViewCell()
        }

        let section = FilterSection(rawValue: indexPath.section)!
        switch section {
        case .info:
            filterCell.setup(title: "Name", subtitle: "Give a name", isSelected: selectedIndexPaths.contains(indexPath), showIndicator: true)

        case .species:
            filterCell.setup(title: "Species", subtitle: "Select one", isSelected: selectedIndexPaths.contains(indexPath), showIndicator: true)

        default:
            filterCell.setup(title: section.options[indexPath.row], isSelected: false, showIndicator: false)
        }

        return filterCell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let section = FilterSection(rawValue: indexPath.section)!

        if selectedIndexPaths.contains(indexPath) {
            selectedIndexPaths.remove(at: selectedIndexPaths.firstIndex(of: indexPath)!)
            tableView.deselectRow(at: indexPath, animated: true)

            switch section {
            case .info:
                characterFilter.selectedName = nil

            case .species:
                characterFilter.selectedSpecies = nil

            default:
                print("")
            }

            
        } else {
            selectRow(indexPath)

            switch section {
            case .info, .species:
                let searchController = FilterNameViewController()
                searchController.delegate = self
                searchController.section = indexPath.section

                self.navigationController?.pushViewController(searchController, animated: true)

            default:
                print("")
            }
        }
    }

    func selectRow(_ selectedIndexPath: IndexPath) {
        for indexPath in selectedIndexPaths {
            if indexPath.section == selectedIndexPath.section {
                tableView.deselectRow(at: indexPath, animated: true)
            }
        }

        selectedIndexPaths.append(selectedIndexPath)
    }
}

extension FilterViewController: FilterSearchDelegate {
    func didFinished(_ search: String?, _ associatedSection: Int) {
        let section = FilterSection(rawValue: associatedSection)!

        switch section {
        case .info:
            characterFilter.selectedName = search

        case .species:
            characterFilter.selectedSpecies = search

        default:
            print("No value will be associated")
        }
    }
}
