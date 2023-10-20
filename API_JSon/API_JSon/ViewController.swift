//
//  ViewController.swift
//  API_JSon
//HuyenViewController
//
//  Created by Fy Spoti on 20/10/2023.
//

import UIKit



class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

//        var delegate: WebServices?
//
//        delegate?.callAPI()
        
       getDistrictByProvineID(provindID: "1")

        // Do any additional setup after loading the view.
    }
    func getDistrictByProvineID(provindID : String) {
        WebServices.shared.callAPI()
        
    }

    @IBAction func chossenProvincesClicked(_ sender: Any) {
        performSegue(withIdentifier: "toSelectedProvincesVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSelectedProvincesVC" {
//            let destinationVC = segue.destination as! SelectedProvincesVC
//            destinationVC.delegate = self
            
        }
    }
}

