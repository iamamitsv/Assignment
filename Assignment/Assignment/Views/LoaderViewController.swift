//
//  LoaderViewController.swift
//  Assignment
//
//  Created by Jaimini Chaturvedi on 22/08/20.
//  Copyright © 2020 Jaimini Chaturvedi. All rights reserved.
//
import UIKit

class LoaderViewController: UIViewController {
    var loader = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.large)
    override func loadView() {
        view = UIView()
       // view.backgroundColor = UIColor(white: 0, alpha: 0.3)
        loader.translatesAutoresizingMaskIntoConstraints = false
        loader.startAnimating()
        view.addSubview(loader)

        loader.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loader.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}
