//
//  TabbarFirstViewController.swift
//  FRRIBsDemo
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
        let bt = UIButton.init(type: .custom)
        bt.titleLabel?.textColor = UIColor.white
        bt.setTitle("present一个控制器", for: UIControlState.normal)
        bt.contentCompressionResistancePriority(for: .horizontal)
        bt.contentCompressionResistancePriority(for: .vertical)
        bt.rx.tap.subscribe {[weak self] (event) in
            self?.listener?.didClickButton()
        }.disposed(by: disposeBag)
        bt.backgroundColor = UIColor.red
        view.addSubview(bt)
        bt.snp.makeConstraints { (maker) in
            maker.top.equalTo(80)
            maker.left.equalTo(60)
//            maker.width.equalTo(120)
//            maker.height.equalTo(60)
        }
    }
}
