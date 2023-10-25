//
//  SelectedProvincesVC.swift
//  API_JSon
//
//  Created by Fy Spoti on 20/10/2023.
//

import UIKit
protocol ProvineDelegate{
    // tra ve provineID
}


class SelectedProvincesVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var provindes : [Province]?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.provindes!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = provindes![indexPath.row].name!
        return cell
    }
    
    @IBOutlet weak var tableViewProvinces: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableViewProvinces.delegate = self
        tableViewProvinces.dataSource = self
        // Do any additional setup after loading the view.
        getProvinces()
       
        }
    func getProvinces(){
        WebServices.shared.callAPIProvinces() { provinces in
            if let province = provinces {
                self.provindes = province
                self.tableViewProvinces.reloadData()

                
            } else {
                // Handle the error
                print("Failed to fetch districts")
            }
        }
        
        
    }
    
}
    





        

