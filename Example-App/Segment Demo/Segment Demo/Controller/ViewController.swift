//
//  ViewController.swift
//  Segment Demo
//
//  Created by Vignesh Narayanasamy on 02/10/17.
//  Copyright © 2017 Vignesh Narayanasamy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //  MARK:-  Outlets
    @IBOutlet weak var segmentedControl: DQSegmentedControl!
    
    //  MARK:-  Properties

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

//  MARK:-  UI Setup

extension ViewController {
    
    fileprivate func setupUI() {
        segmentedControl.applySelectionIndicator(indicatorPosition: .Top, indicatorColor: .orange)
    }
}
