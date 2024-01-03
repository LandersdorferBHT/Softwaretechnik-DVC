//
//  MainViewController.swift
//  SpaceX Project
//
//  Created by Anton Landersdorfer on 30.10.19.
//  Copyright © 2019 Anton Landersdorfer. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // Data Store
    internal var rockets = [Rocket]()
    internal var selectedRocket = 0
    
    //MARK: TableView
    private var mainTableView = UITableView()
    
    private func setupTableView () {
        mainTableView.delegate = self
        mainTableView.dataSource = self
        
        mainTableView.translatesAutoresizingMaskIntoConstraints = false
        mainTableView.register(UITableViewCell.self, forCellReuseIdentifier: "Main Cell")
        
        view.addSubview(mainTableView)
        
        NSLayoutConstraint.activate([
            mainTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            mainTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            mainTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            mainTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0)
        ])
        
        mainTableView.backgroundColor = .clear
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rockets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let rocket = rockets[indexPath.row]
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "Main Cell")
        
        
        cell.textLabel?.text = rocket.rocketName
        
        cell.detailTextLabel?.numberOfLines = 0
        cell.detailTextLabel?.text = rocket.description
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedRocket = indexPath.row
        performSegue(withIdentifier: "Show Details", sender: self)
    }
    
    override func performSegue(withIdentifier identifier: String, sender: Any?) {
        if identifier == "Show Details" {
            let detailVC = DetailViewController()
            detailVC.detailRocket = rockets[selectedRocket]
            navigationController?.show(detailVC, sender: self)
        }
    }
    
    // MARK: Data
    // Getting Data from Server

    private let url = URL(string: "https://api.spacexdata.com/v3/rockets")!
    
    private func requestData() {
        
        spinner.startAnimating()
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let data = data {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                
                do {
                    self.rockets = try! decoder.decode([Rocket].self, from: data)
                }
            }
            
            DispatchQueue.main.async {
                self.mainTableView.reloadData()
                self.spinner.stopAnimating()
            }
            
        }.resume()
    }
    
    private var spinner: UIActivityIndicatorView!
    
    internal func createSpinnerView() {
        spinner = UIActivityIndicatorView(style: .medium)
        spinner.hidesWhenStopped = true
        spinner.startAnimating()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: spinner)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "SpaceX Rockets"
        view.backgroundColor = .systemGroupedBackground
        
        createSpinnerView()
        setupTableView()
        requestData()

    }
}

