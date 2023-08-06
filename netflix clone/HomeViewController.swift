//
//  HomeViewController.swift
//  netflix clone
//
//  Created by Saurabh Dalakoti on 06/08/23.
//

import UIKit

class HomeViewController: UIViewController {

    let sectionTitles: [String] = [
        "Trending Movies",
        "Trending TV",
        "Popular",
        "Upcoming Movies",
        "Top Rated"
    ]
    
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
        getDataFromServer()
    }
    
    private func getDataFromServer(){
        /*
        APICaller.shared.getTrendingMovies{ results in
            switch results{
            case .success(let movies):
                print(movies)
            case .failure(let error):
                print(error)
            }
        }
        
        APICaller.shared.getTrendingTVs{ results in
            switch results{
            case .success(let movies):
                print(movies)
            case .failure(let error):
                print(error)
            }
        }
         APICaller.shared.getPopularMovies{ results in
             switch results{
             case .success(let movies):
                 print(movies)
             case .failure(let error):
                 print(error)
             }
         }
         APICaller.shared.getTopRatedMovies{ results in
             switch results{
             case .success(let movies):
                 print(movies)
             case .failure(let error):
                 print(error)
             }
         }
        */
        
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
        return sectionTitles.count
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
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else {return}
        header.textLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
        header.textLabel?.frame = CGRect(x: header.bounds.origin.x + 20, y: header.bounds.origin.y, width: 100, height: header.bounds.height)
        header.textLabel?.textColor = .white
        header.textLabel?.text = header.textLabel?.text?.capitalizeFirstLetter()
    }
    
    // return section title
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitles[section]
    }
    
    // a solution to make sure that navigation header does not sticky to the top
    // table view inherits scrollview, and here is the solution
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let defaultOffset = view.safeAreaInsets.top
        let offset = scrollView.contentOffset.y + defaultOffset
        
        navigationController?.navigationBar.transform = .init(translationX: 0, y: min(0, -offset))
    }
    
}
