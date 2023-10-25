//
//  ViewController.swift
//  API_JSon
//HuyenViewController
//
//  Created by Fy Spoti on 20/10/2023.
//

import UIKit



class SelectedDistrictsVC: UIViewController, ProvineDelegate, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var buttonProvince: UIButton!
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
            return self.districtsOfProvince.count
       
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = districtsOfProvince[indexPath.row].name
        return cell
    }
    

    var districtsOfProvince = [District]()
    @IBOutlet weak var tbView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tbView.delegate = self
        tbView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    func getDistrictsByProvinceID(province: Province){
        districtsOfProvince.removeAll()
        WebServices.shared.callAPIDistricts {
            districts in
            if let districts = districts {
                for district in districts {
                    if district.province_code == province.code {
                        self.districtsOfProvince.append(district)
                    }
                }
                DispatchQueue.main.async {
                    self.tbView.reloadData()
                }
            } else {
                // Handle the error
                print("Failed to fetch districts")
            }
        }
    }

    func sendDelegate(province: Province) {
        buttonProvince.setTitle(province.name, for: .normal)
        getDistrictsByProvinceID(province: province)
    }
    
    @IBAction func chossenProvincesClicked(_ sender: Any) {
        performSegue(withIdentifier: "toSelectedProvincesVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSelectedProvincesVC" {
            let destinationVC = segue.destination as! SelectedProvincesVC
            destinationVC.delegate = self
            
        }
    }
}

