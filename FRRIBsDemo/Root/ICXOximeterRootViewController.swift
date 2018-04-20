//
//  FRRIBsDemoRootViewController.swift
//  FRRIBsDemo
//
//  Created by fanrong on 2018/4/19.
//  Copyright © 2018年 fanrong. All rights reserved.
//

import RIBs
import RxSwift
import UIKit

protocol FRRIBsDemoRootPresentableListener: class {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
}

final class FRRIBsDemoRootViewController: UIViewController, FRRIBsDemoRootPresentable, FRRIBsDemoRootViewControllable {

    weak var listener: FRRIBsDemoRootPresentableListener?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.blue
    }
}


extension FRRIBsDemoRootViewController {
    
    func addViewController(viewController: UIViewController) {
        view.addSubview(viewController.view)
    }
}
