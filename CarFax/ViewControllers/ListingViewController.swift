//
//  ViewController.swift
//  CarFax
//
//  Created by Harsh_Dev on 2020-09-17.
//  Copyright © 2020 Pineapple Inc. All rights reserved.
//

import UIKit

class ListingViewController: BaseViewController,UITableViewDelegate,UITableViewDataSource {
   
    

    @IBOutlet weak var carListingTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        // Do any additional setup after loading the view.
    }

    func setupTableView()
    {
        self.carListingTableView.delegate = self
        self.carListingTableView.dataSource = self
    }

}
extension ListingViewController
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           <#code#>
       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           <#code#>
       }
}
