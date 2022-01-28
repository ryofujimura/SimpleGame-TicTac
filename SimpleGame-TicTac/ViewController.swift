//
//  ViewController.swift
//  SimpleGame-TicTac
//
//  Created by ryo fuj on 1/27/22.
//

import UIKit

class ViewController: UIViewController {
    
    var activePlayer = 1
    let config = UIImage.SymbolConfiguration(font: System 80.0 )
    
    @IBAction func actionTic(_ sender: UIButton) {
        if (activePlayer == 1){
            sender.setImage(UIImage(systemName: "cross.fill", withConfiguration: config), for: UIControl.State())
            activePlayer = 2
        }
        else{
            sender.setImage(UIImage(systemName: "cross.circle.fill"), for: UIControl.State())
            activePlayer = 1
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

