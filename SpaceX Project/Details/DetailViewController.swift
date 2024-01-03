//
//  DetailViewController.swift
//  SpaceX Project
//
//  Created by Anton Landersdorfer on 07.12.19.
//  Copyright © 2019 Anton Landersdorfer. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var detailRocket: Rocket!
    
    private var detailTitles = ["ID", "Is Active", "Stages", "Boosters", "Cost Per Launch", "Success Rate", "First Flight", "Country", "Company", "Height", "Diameter", "Mass", "First Stage", "Description", "Rocket-ID", "Rocket Name", "Rocket Type"]
    internal var details = [String]()
    
    internal var detailTableView = UITableView()
    
    private func setupTableView () {
        detailTableView.delegate = self
        detailTableView.dataSource = self
        
        detailTableView.translatesAutoresizingMaskIntoConstraints = false
        detailTableView.register(DetailTableViewCell.self, forCellReuseIdentifier: "Detail Cell")
        
        view.addSubview(detailTableView)
        
        detailTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        detailTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
        detailTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive = true
        detailTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
        
        detailTableView.backgroundColor = .clear
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return details.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Detail Cell", for: indexPath) as! DetailTableViewCell
        cell.populateData(with: Detail(title: detailTitles[indexPath.row], description: details[indexPath.row]))
        
        return cell
    }


override func viewDidLoad() {
    super.viewDidLoad()
    
    self.title = detailRocket?.rocketName
    view.backgroundColor = .systemGroupedBackground
    
    setupTableView()
    extractData()
}
}
