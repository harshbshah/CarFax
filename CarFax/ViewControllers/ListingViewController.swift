//
//  ViewController.swift
//  CarFax
//
//  Created by Harsh_Dev on 2020-09-17.
//  Copyright © 2020 Pineapple Inc. All rights reserved.
//

import UIKit

class ListingViewController: BaseViewController,UITableViewDelegate,UITableViewDataSource,CallDealerButtonDelegate {
   

    @IBOutlet weak var carListingTableView: UITableView!
    let refreshControl = UIRefreshControl()
    let carListingViewModel:CarListingViewModel = CarListingViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchDataFromServer()
        setupTableView()
        // Do any additional setup after loading the view.
    }

    func setupTableView()
    {
        self.carListingTableView.delegate = self
        self.carListingTableView.dataSource = self
        self.carListingTableView.tableFooterView = UIView()
        self.carListingTableView.register(UINib(nibName: StoryBoard.NibName.CarPreviewCell, bundle: nil), forCellReuseIdentifier: StoryBoard.CoustomCellID.CarPreviewCellID)
        self.carListingTableView.estimatedRowHeight = 300
        self.carListingTableView.rowHeight = UITableView.automaticDimension
        activatePullTorefresh()
        
    }

}
extension ListingViewController
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return carListingViewModel.listing.count
       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = self.carListingTableView.dequeueReusableCell(withIdentifier: StoryBoard.CoustomCellID.CarPreviewCellID) as? CarPreviewCell
         else { return UITableViewCell()}
        if(indexPath.row < carListingViewModel.listing.count)
        {
            cell.callDealerDelegate = self
            cell.callDealerButton.tag = indexPath.row
            cell.setupCell(carPreviewData: mapToCellDataModel(carListingViewModel.listing[indexPath.row]))
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
    
    func mapToCellDataModel(_ listing: Listing) -> CarPreview
    {
        //need to work
        //mapping remaining
        let carPreview = CarPreview.init(carCoverImage: listing.images?.firstPhoto?.medium, carYear: listing.year, carModel: listing.model, carMake: listing.make, carTrim: listing.trim, carPrice: listing.listPrice, carMilage: listing.mileage, carDealerCity: listing.dealer?.city, carDelaerState: listing.dealer?.state, carDealaerContact: listing.dealer?.phone)
        return carPreview
    }
    func fetchDataFromServer()
    {
        
        carListingViewModel.fetchUsedCarDataFromServer { (success,errorMessage) in
                DispatchQueue.main.async {
                    if self.refreshControl.isRefreshing {
                        self.refreshControl.endRefreshing()
                        self.carListingTableView.contentOffset = CGPoint.zero
                    }
                    if success{
                        //reload collection
                        self.carListingTableView.reloadData()
                    }else{
                        let alertView = UIAlertController.init(title: "Sorry", message: errorMessage ?? "Failed to fetch data from server.", preferredStyle: .alert)
                        alertView.addAction(UIAlertAction.init(title: "Ok", style: .cancel, handler: nil))
                        self.navigationController?.present(alertView, animated: true, completion: nil)
                    }
                }
            }
        }
    
}

extension ListingViewController{
    func callDealerPressed(_ tag: Int) {
        if(tag < carListingViewModel.listing.count)
        {
            let phoneToCallStr = carListingViewModel.listing[tag].dealer?.phone ?? ""
            guard let number = URL(string: "tel://" + phoneToCallStr) else { return }
            UIApplication.shared.open(number)
        }
    }
}
