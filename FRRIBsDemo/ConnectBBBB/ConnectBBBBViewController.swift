//
//  ConnectBBBBViewController.swift
//  FRRIBsDemo
//
//  Created by fanrong on 2018/4/20.
//  Copyright © 2018年 fanrong. All rights reserved.
//

import RIBs
import RxSwift
import UIKit

protocol ConnectBBBBPresentableListener: class {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
    func didTouchBegan()
}

final class ConnectBBBBViewController: UIViewController, ConnectBBBBPresentable, ConnectBBBBViewControllable {

    weak var listener: ConnectBBBBPresentableListener?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.purple
        self.title = self.getClassName()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if let nav = navigationController {
            print("WilltopVC: %@", nav.topViewController!)
            print("WillBBB: %@", self)
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        if let nav = navigationController {
            print("DidtopVC: %@", nav.topViewController!)
            print("DidBBB: %@", self)
        }
    }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        listener?.didTouchBegan()
    }
}
