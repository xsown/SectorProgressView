//
//  ViewController.swift
//  SectorProgressView 
//
//  Created by X on 15/12/24.
//  Copyright © 2015年 Shi Xu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var progressView: SectorProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        progressView.layer.cornerRadius = 16.0
    }
    
    override func viewDidAppear(animated: Bool) {
        progressView.progress = 0.0
        progressView.setProgress(1.0, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

