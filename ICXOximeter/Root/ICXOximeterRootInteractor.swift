//
//  ICXOximeterRootInteractor.swift
//  ICXOximeter
//
//  Created by fanrong on 2018/4/19.
//  Copyright © 2018年 fanrong. All rights reserved.
//

import RIBs
import RxSwift

protocol ICXOximeterRootRouting: LaunchRouting {
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
    func routToTabbar()
}

protocol ICXOximeterRootPresentable: Presentable {
    weak var listener: ICXOximeterRootPresentableListener? { get set }
    // TODO: Declare methods the interactor can invoke the presenter to present data.
}

protocol ICXOximeterRootListener: class {
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
}

final class ICXOximeterRootInteractor: PresentableInteractor<ICXOximeterRootPresentable>, ICXOximeterRootInteractable, ICXOximeterRootPresentableListener {

    weak var router: ICXOximeterRootRouting?
    weak var listener: ICXOximeterRootListener?

    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    override init(presenter: ICXOximeterRootPresentable) {
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
