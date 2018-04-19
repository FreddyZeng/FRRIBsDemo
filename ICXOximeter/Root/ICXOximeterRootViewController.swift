//
//  ICXOximeterRootViewController.swift
//  ICXOximeter
//
//  Created by fanrong on 2018/4/19.
//  Copyright © 2018年 fanrong. All rights reserved.
//

import RIBs
import RxSwift
import UIKit

protocol ICXOximeterRootPresentableListener: class {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
}

final class ICXOximeterRootViewController: UIViewController, ICXOximeterRootPresentable, ICXOximeterRootViewControllable {

    weak var listener: ICXOximeterRootPresentableListener?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.blue
    }
}


extension ICXOximeterRootViewController {
    
    func addViewController(viewController: UIViewController) {
        view.addSubview(viewController.view)
    }
}
