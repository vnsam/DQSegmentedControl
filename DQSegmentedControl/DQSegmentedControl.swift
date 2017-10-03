//
//  DQSegmentedControl.swift
//  Segment Demo
//
//  Created by Vignesh Narayanasamy on 02/10/17.
//  Copyright © 2017 Vignesh Narayanasamy. All rights reserved.
//

import UIKit

class DQSegmentedControl: UISegmentedControl {
    
    //  MARK:-  Properties
    fileprivate var selectionBarView: IndicatorBarView?
}

//  MARK:-  Thin bar indicator setup

extension DQSegmentedControl {
    
    func applySelectionIndicator(indicatorPosition: IndicatorPostion, indicatorColor: UIColor, normalTitleTextAttributes: [AnyHashable: Any]? = nil, selectedTitleTextAttributes: [AnyHashable: Any]? = nil) {
        
        backgroundColor = .clear
        tintColor = .clear

        self.setTitleTextAttributes(normalTitleTextAttributes ??
            getDafultTitleTextAttribues(), for: .normal)
        self.setTitleTextAttributes(selectedTitleTextAttributes ??
            getDafultTitleTextAttribues(), for: .selected)
        
        selectionBarView = IndicatorBarView.init(positionOnSegment: indicatorPosition, color: indicatorColor, onSegmentedControl: self)
        selectionBarView!.setupIndicatorBarView()
        
        //  Update selection bar on selection
        addTarget(selectionBarView!,
                  action: #selector(selectionBarView!.updateSelectionBar),
                  for: .valueChanged)
    }
    
}

//  MARK:-  Default customizations

extension DQSegmentedControl {
    
    fileprivate func getDafultTitleTextAttribues() -> [AnyHashable: Any] {
        return [NSAttributedStringKey.foregroundColor: UIColor.darkGray]
    }
}
