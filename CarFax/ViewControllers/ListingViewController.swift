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
    let refreshControl = UIRefreshControl()
    
    var carListingData:[String] = Array.init(repeating: "ABC", count: 5)
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        // Do any additional setup after loading the view.
    }

    func setupTableView()
    {
        self.carListingTableView.delegate = self
        self.carListingTableView.dataSource = self
        self.carListingTableView.tableFooterView = UIView()
        self.carListingTableView.register(UINib(nibName: StoryBoard.NibName.CarPreviewCell, bundle: nil), forCellReuseIdentifier: StoryBoard.CoustomCellID.CarPreviewCellID)
        self.carListingTableView.estimatedRowHeight = 44
        self.carListingTableView.rowHeight = UITableView.automaticDimension
        activatePullTorefresh()
        
    }

}
extension ListingViewController
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return carListingData.count
       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = self.carListingTableView.dequeueReusableCell(withIdentifier: StoryBoard.CoustomCellID.CarPreviewCellID) as? CarPreviewCell
         else { return UITableViewCell()}
        if(indexPath.row < carListingData.count)
        {
            cell.setupCell(carPreviewData: CarPreview.init(carCoverImage: "https://carfax-img.vast.com/carfax/4550688195707539809/1/344x258", carYear: 2011, carModel: "Accord", carMake: "Honda", carTrim: "Sports", carPrice: 20000, carMilage: "200", carDealerCity: "Toronto", carDelaerState: "ON", carDealaerContact: "123-456-7890"))
        }
        
        return cell
    }
    
    
}

//MARK: Pull to referesh
extension ListingViewController{
    func activatePullTorefresh(){
        refreshControl.addTarget(self, action: #selector(refreshContaint) , for: .valueChanged)
        carListingTableView.refreshControl = refreshControl
    }
    
    @objc func refreshContaint(){
        fetchDataFromServer()
    }
}

extension ListingViewController{
    func fetchDataFromServer()
    {
        
    }
}
