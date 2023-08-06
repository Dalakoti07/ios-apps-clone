//
//  HomeViewController.swift
//  netflix clone
//
//  Created by Saurabh Dalakoti on 06/08/23.
//

import UIKit

class HomeViewController: UIViewController {

    private let homeFeedTable: UITableView = {
        let table = UITableView(
            frame: .zero,
            style: .grouped
        )
        table.register(
            CollectionViewTableViewCell.self,
            forCellReuseIdentifier: CollectionViewTableViewCell.identifier
        )
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        view.addSubview(homeFeedTable)
        
        // add data
        homeFeedTable.delegate = self
        homeFeedTable.dataSource = self
        
        configureNavBar()
        
        // for top hero header in tabe view
        homeFeedTable.tableHeaderView = HeroHeaderUiView(frame: CGRect(
            x: 0, y: 0, width: view.bounds.width, height: 450
        ))
    }
    
    func configureNavBar(){
        var image = UIImage(named: "netflix")
        image = image?.withRenderingMode(.alwaysOriginal)
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: image, style: .done, target: self, action: nil
        )
        
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(image: UIImage(systemName: "person"), style: .done, target: self, action: nil),
            UIBarButtonItem(image: UIImage(systemName: "play.rectangle"), style: .done, target: self, action: nil)
        ]
        navigationController?.navigationBar.tintColor = .white
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        homeFeedTable.frame = view.bounds
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource{

    func numberOfSections(in tableView: UITableView) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionViewTableViewCell.identifier, for: indexPath) as? CollectionViewTableViewCell else {
            return UITableViewCell()
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
}
