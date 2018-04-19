//
//  ConnectAAAAInteractor.swift
//  ICXOximeter
//
//  Created by fanrong on 2018/4/19.
//  Copyright © 2018年 fanrong. All rights reserved.
//

import RIBs
import RxSwift

protocol ConnectAAAARouting: ViewableRouting {
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
}

protocol ConnectAAAAPresentable: Presentable {
    weak var listener: ConnectAAAAPresentableListener? { get set }
    // TODO: Declare methods the interactor can invoke the presenter to present data.
}

protocol ConnectAAAAListener: class {
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
}

final class ConnectAAAAInteractor: PresentableInteractor<ConnectAAAAPresentable>, ConnectAAAAInteractable, ConnectAAAAPresentableListener {

    weak var router: ConnectAAAARouting?
    weak var listener: ConnectAAAAListener?

    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    override init(presenter: ConnectAAAAPresentable) {
        super.init(presenter: presenter)
        presenter.listener = self
    }

    override func didBecomeActive() {
        super.didBecomeActive()
        // TODO: Implement business logic here.
    }

    override func willResignActive() {
        super.willResignActive()
        // TODO: Pause any business logic.
    }
}
