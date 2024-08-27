//
//  FlatSegmentedControl.swift
//  CathayBankTest
//
//  Created by 油答 on 2024/8/26.
//

import UIKit

class FlatSegmentedControl: UISegmentedControl {

    override init(frame: CGRect) {
        super.init(frame: frame)
        FlatStyle()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        FlatStyle()
    }
    
    func FlatStyle() {
        
        // 清除原有樣式
        layer.cornerRadius = 0.0
        layer.borderWidth = 0
        layer.borderColor = UIColor.clear.cgColor
        layer.masksToBounds = false
        setDividerImage(UIImage(), forLeftSegmentState: .application, rightSegmentState: .application, barMetrics: .default)
        //設定未選的樣式
        setBackgroundImage(UIImage(color: UIColor.clear), for: .normal, barMetrics: .default)
        setTitleTextAttributes(
            [NSAttributedString.Key.foregroundColor : UIColor.greyishBrown,
             NSAttributedString.Key.font:UIFont.systemFont(ofSize: 18.0, weight: UIFont.Weight.medium)],
            for: UIControl.State.normal)
        
        //設定被選的樣式
        setBackgroundImage(selectedBackgroundImage(), for: .selected, barMetrics: .default)
        setTitleTextAttributes(
            [NSAttributedString.Key.foregroundColor : UIColor.greyishBrown,
             NSAttributedString.Key.font:UIFont.systemFont(ofSize: 18.0, weight: UIFont.Weight.medium)],
            for: UIControl.State.selected)
        
        //self.se
    }
    
    private func selectedBackgroundImage() -> UIImage {
        let rect = CGRect(x: 0.0, y: 0.0, width:  self.frame.width, height: self.frame.height)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        //畫背景
        context!.setFillColor(UIColor.clear.cgColor);
        context!.fill(rect);
        //畫粗底線
        context?.setFillColor(UIColor.hotPink.cgColor)
        context?.addPath(UIBezierPath(roundedRect: CGRect(x: 24, y: rect.height - 4, width: rect.width - 48, height: 4), cornerRadius: 16.0).cgPath)
        context?.fillPath(using: .evenOdd)
        let image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return image!.resizableImage(withCapInsets: UIEdgeInsets(top: 0, left: 1, bottom: 0, right: 1), resizingMode: .stretch)
    }

}

public extension UIImage {
    convenience init?(color: UIColor, size: CGSize = CGSize(width: 1, height: 1)) {
        let rect = CGRect(origin: .zero, size: size)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
        color.setFill()
        UIRectFill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        guard let cgImage = image?.cgImage else { return nil }
        self.init(cgImage: cgImage)
    }
}
