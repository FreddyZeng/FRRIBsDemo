//
//  ConnectBBBBInteractor.swift
//  FRRIBsDemo
//
//  Created by fanrong on 2018/4/20.
//  Copyright © 2018年 fanrong. All rights reserved.
//

import RIBs
import RxSwift

protocol ConnectBBBBRouting: ViewableRouting {
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
}

protocol ConnectBBBBPresentable: Presentable {
    weak var listener: ConnectBBBBPresentableListener? { get set }
    // TODO: Declare methods the interactor can invoke the presenter to present data.
}

protocol ConnectBBBBListener: class {
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
    func didFinish()
}

final class ConnectBBBBInteractor: PresentableInteractor<ConnectBBBBPresentable>, ConnectBBBBInteractable, ConnectBBBBPresentableListener {
    func didTouchBegan() {
        listener?.didFinish()
    }
    

    weak var router: ConnectBBBBRouting?
    weak var listener: ConnectBBBBListener?

    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    override init(presenter: ConnectBBBBPresentable) {
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
