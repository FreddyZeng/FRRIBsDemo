//
//  ConnectAAAAViewController.swift
//  FRRIBsDemo
//
//  Created by fanrong on 2018/4/19.
//  Copyright © 2018年 fanrong. All rights reserved.
//

import RIBs
import RxSwift
import UIKit
import SnapKit

protocol ConnectAAAAPresentableListener: class {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
    func didTouchBegan()
    func didClickButton()
}

final class ConnectAAAAViewController: UIViewController, ConnectAAAAPresentable, ConnectAAAAViewControllable {

    deinit {
        print("ConnectAAAAViewController, 销毁了")
    }
    
    weak var listener: ConnectAAAAPresentableListener?
    
    let disposeBag = DisposeBag()
    
    let tipsButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("触摸除了Button之外dimiss\n点击按钮,push一个页面", for: UIControlState.normal)
        button.titleLabel?.textColor = UIColor.white
        button.backgroundColor = UIColor.red
        button.contentCompressionResistancePriority(for: .horizontal)
        button.contentCompressionResistancePriority(for: .vertical)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("ConnectAAAAViewController, 创建了 %@", self)
        view.backgroundColor = UIColor.white
        view.addSubview(tipsButton)
        tipsButton.snp.makeConstraints { (maker) in
            maker.top.equalTo(100)
            maker.right.equalTo(-45)
//            maker.width.equalTo(120)
//            maker.height.equalTo(60)
        }
        tipsButton.rx.tap.subscribe({[weak self] (event) in
            self?.listener?.didClickButton()
        }).disposed(by: disposeBag)
        title = self.getClassName()
    }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        listener?.didTouchBegan()
    }
    
}
