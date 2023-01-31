//
//  HomeViewController.swift
//  demoTest
//
//  Created by Nikita Savchik on 23/01/2023.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        dismiss(animated: true)
    }
}
