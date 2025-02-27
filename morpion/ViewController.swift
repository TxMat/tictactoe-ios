//
//  ViewController.swift
//  morpion
//
//  Created by Mathieu Ponal on 27/02/2025.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnTouch(_ sender: UIButton) {
        print(sender.tag)
    }
    
}

