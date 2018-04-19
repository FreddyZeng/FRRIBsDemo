//
//  TabbarFirstViewController.swift
//  ICXOximeter
//
//  Created by fanrong on 2018/4/19.
//  Copyright © 2018年 fanrong. All rights reserved.
//

import RIBs
import RxSwift
import UIKit
import SnapKit
import RxCocoa


protocol TabbarFirstPresentableListener: class {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
    func didClickButton()
}

final class TabbarFirstViewController: UIViewController, TabbarFirstPresentable, TabbarFirstViewControllable {

    weak var listener: TabbarFirstPresentableListener?
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.gray
        let bt = UIButton.init(type: .infoDark)
        bt.rx.tap.subscribe {[weak self] (event) in
            self?.listener?.didClickButton()
        }.disposed(by: disposeBag)
        bt.backgroundColor = UIColor.red
        bt.titleLabel?.text = "abcd"
        view.addSubview(bt)
        bt.snp.makeConstraints { (maker) in
            maker.top.equalTo(80)
            maker.left.equalTo(60)
        }
    }
}
