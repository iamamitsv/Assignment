//
//  ImageHelper.swift
//  Assignment
//
//  Created by Jaimini Chaturvedi on 15/08/20.
//  Copyright © 2020 Jaimini Chaturvedi. All rights reserved.
//
import Foundation
import UIKit

protocol ImageHelperProtocol {
    func updateImageForTableViewCell(_ cell: UITableViewCell, inTableView tableView: UITableView, imageURL: String, atIndexPath indexPath: IndexPath)
}

class ImageHelper: ImageHelperProtocol {
    fileprivate let placeHolderImageViewTag = 1
    fileprivate let placeHolderImage = UIImage(named: Constants.Assets.PlaceholderImage)!
    var imageManager: ImageManager { return ImageManager() }
    
    func updateImageForTableViewCell(_ cell: UITableViewCell, inTableView tableView: UITableView, imageURL: String, atIndexPath indexPath: IndexPath) {
        let imageView = cell.viewWithTag(placeHolderImageViewTag) as? UIImageView
        imageView?.image = placeHolderImage
        imageManager.downloadImageFromURL(imageURL) { (success, image) -> Void in
            if success && image != nil {
                if (tableView.indexPath(for: cell) as NSIndexPath?)?.row == (indexPath as NSIndexPath).row {
                    imageView?.image = image
                }
            }
        }
    }
}
