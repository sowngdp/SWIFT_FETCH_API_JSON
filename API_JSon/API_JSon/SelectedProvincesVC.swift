//
//  SelectedProvincesVC.swift
//  API_JSon
//
//  Created by Fy Spoti on 20/10/2023.
//

import UIKit
protocol ProvineDelegate{
    func sendDelegate(province: Province)
}


class SelectedProvincesVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var delegate : ProvineDelegate?
    var provindes : [Province]?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if provindes != nil {
            return self.provindes!.count
        }
            else{
            return 0
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = provindes![indexPath.row].name!
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(provindes![indexPath.row].code)
        delegate?.sendDelegate(province: provindes![indexPath.row])
        self.navigationController?.popViewController(animated: true)
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
                DispatchQueue.main.async {
                    self.tableViewProvinces.reloadData()
                }

                
            } else {
                // Handle the error
                print("Failed to fetch districts")
            }
        }
        
        
    }
    
}
    





        

