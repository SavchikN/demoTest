//
//  ResultViewController.swift
//  demoTest
//
//  Created by Nikita Savchik on 31/01/2023.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet var defaultResults: UILabel!
    @IBOutlet var multipleResults: UILabel!
    
    var results: Int!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        defaultResults.text = "Default result: \(results!)"
    }
}
