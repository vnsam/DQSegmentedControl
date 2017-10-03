//
//  Indicator.swift
//  Segment Demo
//
//  Created by Vignesh Narayanasamy on 02/10/17.
//  Copyright © 2017 Vignesh Narayanasamy. All rights reserved.
//


/// Selected segment indicator postion
///
/// - Top: Shows at the top of the selected segment
/// - Bottom: Shows at the bottom of the selected segment
enum IndicatorPostion {
    case Top
    case Bottom
}

import Foundation
import UIKit

class IndicatorBarView: UIView {

    fileprivate (set) var indicatorPosition = IndicatorPostion.Bottom
    fileprivate (set) var indicatorColor = UIColor.orange
    fileprivate let segmentedControl: UISegmentedControl

    init(positionOnSegment: IndicatorPostion, color: UIColor, onSegmentedControl: UISegmentedControl) {
        
        indicatorPosition = positionOnSegment
        indicatorColor = color
        segmentedControl = onSegmentedControl
        
        super.init(frame: .zero)

        setupIndicatorBarView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//  MARK:-  Customizations

extension IndicatorBarView {

    func setupIndicatorBarView() {
        //  Add selection bar
        //  View create
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = indicatorColor
        segmentedControl.addSubview(self)
        
        //  View add constraints
        switch indicatorPosition {
        case .Top: self.bottomAnchor.constraint(equalTo: segmentedControl.topAnchor)
            .isActive = true
        case .Bottom: self.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor)
            .isActive = true
        }
        
        self.heightAnchor.constraint(equalToConstant: 5).isActive = true
        self.leftAnchor.constraint(equalTo: segmentedControl.leftAnchor).isActive = true
        self.widthAnchor.constraint(equalTo: segmentedControl.widthAnchor, multiplier: 1 / CGFloat(segmentedControl.numberOfSegments)).isActive = true
    }
}

//  MARK:-  Apperance update function

extension IndicatorBarView {
    
    @objc dynamic func updateSelectionBar() {
        UIView.animate(withDuration: 0.3) {
            self.frame.origin.x = (self.segmentedControl.frame.width / CGFloat(self.segmentedControl.numberOfSegments)) * CGFloat(self.segmentedControl.selectedSegmentIndex)
        }
    }
    
}
