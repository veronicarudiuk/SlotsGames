//
//  UISegmentedControlExtension.swift
//  SlotsGames
//
//  Created by Veronica Rudiuk on 24.12.22.
//

import UIKit

extension UISegmentedControl{
    
    //MARK: - setupCustomSegmentControl
    func setupCustomSegmentControl() {
        let backgroundImage = UIImage(named: "CategoryPickerBG")
        self.setBackgroundImage(backgroundImage, for: .normal, barMetrics: .default)
        self.setBackgroundImage(backgroundImage, for: .selected, barMetrics: .default)
        self.setBackgroundImage(backgroundImage, for: .highlighted, barMetrics: .default)
        
        self.setFont(name: K.Fonts.sfProDisplayRegular, size: 20, color: UIColor(named: K.BrandColors.lightGrayText) ?? .white, state: .normal)
        self.setFont(name: K.Fonts.sfProDisplayBold, size: 20, color: .white, state: .selected)
        
        self.setCustomOffset(margin: 5, segment: 0, alignment: .left)
        self.setCustomOffset(margin: 25, segment: 1, alignment: .right)
        
    }
    
    //MARK: - Set the alignment of segmented control titles
    func setCustomOffset(margin: Int, segment: Int, alignment: UIControl.ContentHorizontalAlignment) {
        let fontAttributes = titleTextAttributes(for: .normal)
        let segmentWidth = self.widthForSegment(at: segment)
        let title = titleForSegment(at: segment)
        guard let title = title else { return }
        let titleSize = title.size(withAttributes: fontAttributes)
        let offset = Int(segmentWidth - titleSize.width) / 2 + margin
        switch alignment {
        case .right:
            self.setContentOffset(CGSize(width: -offset, height: 0), forSegmentAt: segment)
        case .left:
            self.setContentOffset(CGSize(width: offset, height: 0), forSegmentAt: segment)
        default:
            return
        }
    }
    
    //MARK: - Set font for segmented control titles
    func setFont(name: String, size: CGFloat, color: UIColor, state: UIControl.State) {
        self.setTitleTextAttributes([NSAttributedString.Key.font : UIFont(name: name, size: size)!, NSAttributedString.Key.foregroundColor: color], for: state)
    }
}


