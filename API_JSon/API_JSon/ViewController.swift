//
//  ViewController.swift
//  API_JSon
//
//  Created by Fy Spoti on 20/10/2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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
