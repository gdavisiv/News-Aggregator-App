//
//  ViewController.swift
//  NewsAggregatorApp
//
//  Created by George Davis IV on 5/31/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "News"
        view.backgroundColor = .systemBackground
        
        APICaller.shared.getTopStories { result in
            
        }
    }
}

