//
//  Extensions.swift
//  Assignment
//
//  Created by Jaimini Chaturvedi on 15/08/20.
//  Copyright © 2020 Jaimini Chaturvedi. All rights reserved.
//

import Foundation
import UIKit

extension ContentFeedModel: Parsing {
    static func parseObject(data: Data) -> Result<ContentFeedModel, ErrorResult> {
        let decoder = JSONDecoder()
        if let result = try? decoder.decode(ContentFeedModel.self, from: data) {
            return Result.success(result)
        } else {
            return Result.failure(ErrorResult.parser(string: Constants.Messages.ParsingErrorMessage))
        }
    }
}


// MARK:- ReusableView
protocol ReusableView: class {}
extension ReusableView where Self: UIView {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
extension UITableViewCell: ReusableView { }

// MARK:- AlertView
extension UIAlertController {
    class func alert(title:String, msg:String, buttonTitle:String, target: UIViewController) {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: buttonTitle, style: UIAlertAction.Style.default) {
        (result: UIAlertAction) -> Void in
        })
        target.present(alert, animated: true, completion: nil)
    }
}

// MARK:- DeviceType
 public extension UIDevice {
    class var isPhone: Bool {
        return UIDevice.current.userInterfaceIdiom == .phone
    }
    class var isPad: Bool {
        return UIDevice.current.userInterfaceIdiom == .pad
    }
}
