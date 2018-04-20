//
//  FRRIBsDemoRootInteractor.swift
//  FRRIBsDemo
//
//  Created by fanrong on 2018/4/19.
//  Copyright © 2018年 fanrong. All rights reserved.
//

import RIBs
import RxSwift

protocol FRRIBsDemoRootRouting: LaunchRouting {
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
    func routToTabbar()
}

protocol FRRIBsDemoRootPresentable: Presentable {
    weak var listener: FRRIBsDemoRootPresentableListener? { get set }
    // TODO: Declare methods the interactor can invoke the presenter to present data.
}

protocol FRRIBsDemoRootListener: class {
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
}

final class FRRIBsDemoRootInteractor: PresentableInteractor<FRRIBsDemoRootPresentable>, FRRIBsDemoRootInteractable, FRRIBsDemoRootPresentableListener {

    weak var router: FRRIBsDemoRootRouting?
    weak var listener: FRRIBsDemoRootListener?

    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    override init(presenter: FRRIBsDemoRootPresentable) {
        super.init(presenter: presenter)
        presenter.listener = self
    }

    override func didBecomeActive() {
        super.didBecomeActive()
        // TODO: Implement business logic here.
        router?.routToTabbar()
    }

    override func willResignActive() {
        super.willResignActive()
        // TODO: Pause any business logic.
    }
}
