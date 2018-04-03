//
//  ViewController.swift
//  EasyNavigationTitle
//
//  Created by 4egoshev on 04/03/2018.
//  Copyright (c) 2018 4egoshev. All rights reserved.
//

import UIKit
import EasyNavigationTitle

class MainViewController: UIViewController {
    
    let navTitle = EasyNavigationTitleView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        setupTitle(with: nil)
        setupSimulateButton(with: "Typing", and: #selector(typing(_:)))
    }
    
    func setupTitle(with subTitle: String?) {
        navTitle.configTitle(on: navigationController,
                             to: navigationItem,
                             title: "Finn Mertens",
                             titleColor: UIColor.black,
                             subText: subTitle,
                             subTextcolor: UIColor.lightGray)
    }
    
    func setupSimulateButton(with title: String, and selector: Selector) {
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: title, style: .plain, target: self, action: selector)
    }

    @objc func typing(_ sender: UIBarButtonItem) {
        setupTitle(with: "typing...")
        setupSimulateButton(with: "Stop Typing", and: #selector(stopTyping(_:)))
    }
    
    @objc func stopTyping(_ sender: UIBarButtonItem) {
        setupTitle(with: nil)
        setupSimulateButton(with: "Typing", and: #selector(typing(_:)))
    }

}

