//
//  SelectedProvincesVC.swift
//  API_JSon
//
//  Created by Fy Spoti on 20/10/2023.
//

import UIKit

class SelectedProvincesVC: UIViewController {
    @IBOutlet weak var tableViewProvinces: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let url = URL(string: "https://provinces.open-api.vn/api/p/")
        
        let sesion = URLSession.shared
        
        let task = sesion.dataTask(with: url!) {
            (data, respones, error) in
            if error != nil {
                let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                
                let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
                
                alert.addAction(okButton)
                
                self.present(alert, animated: true, completion: nil)
                
            } else {
                
                if data != nil {
                    
                }
                
            }
        }
    }

   

}
