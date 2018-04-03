//
//  EasyNavigationTitleView.swift
//  EasyNavigationTitle
//
//  Created by 4egoshev on 03.04.2018.
//  Copyright © 2018 4egoshev. All rights reserved.
//

import UIKit

public class EasyNavigationTitleView: UIView {
    
    public init() {
        super.init(frame: .zero)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public func configTitle(on navigationController: UINavigationController?, to navigationItem: UINavigationItem, title: String, titleColor: UIColor, subText: String?, subTextcolor: UIColor) {
        let titleText = title
        guard let subTitle = subText else {
            navigationItem.titleView = nil
            navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor : titleColor]
            navigationItem.title = title
            return
        }
        let titleParameters = [NSAttributedStringKey.foregroundColor : titleColor,
                               NSAttributedStringKey.font : UIFont.systemFont(ofSize: 16)]
        let subtitleParameters = [NSAttributedStringKey.foregroundColor : subTextcolor,
                                  NSAttributedStringKey.font : UIFont.systemFont(ofSize: 10)]
        
        let title:NSMutableAttributedString = NSMutableAttributedString(string: titleText, attributes: titleParameters)
        let subtitle:NSAttributedString = NSAttributedString(string: subTitle, attributes: subtitleParameters)
        
        title.append(NSAttributedString(string: "\n"))
        title.append(subtitle)
        
        let size = title.size()
        let width = size.width
        guard let height = navigationController?.navigationBar.frame.size.height else {return}
        
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: width, height: height))
        titleLabel.attributedText = title
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .center
        
        navigationItem.titleView = titleLabel
    }
    
}
