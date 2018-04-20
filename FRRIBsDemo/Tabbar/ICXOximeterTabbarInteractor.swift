//
//  FRRIBsDemoTabbarInteractor.swift
//  FRRIBsDemo
//
//  Created by fanrong on 2018/4/19.
//  Copyright © 2018年 fanrong. All rights reserved.
//

import RIBs
import RxSwift

protocol FRRIBsDemoTabbarRouting: ViewableRouting {
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
    func addBarItem()
}

protocol FRRIBsDemoTabbarPresentable: Presentable {
    weak var listener: FRRIBsDemoTabbarPresentableListener? { get set }
    // TODO: Declare methods the interactor can invoke the presenter to present data.
}

protocol FRRIBsDemoTabbarListener: class {
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
}

final class FRRIBsDemoTabbarInteractor: PresentableInteractor<FRRIBsDemoTabbarPresentable>, FRRIBsDemoTabbarInteractable, FRRIBsDemoTabbarPresentableListener {

    weak var router: FRRIBsDemoTabbarRouting?
    weak var listener: FRRIBsDemoTabbarListener?

    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    override init(presenter: FRRIBsDemoTabbarPresentable) {
        super.init(presenter: presenter)
        presenter.listener = self
    }

    override func didBecomeActive() {
        super.didBecomeActive()
        // TODO: Implement business logic here.
        router?.addBarItem()
    }

    override func willResignActive() {
        super.willResignActive()
        // TODO: Pause any business logic.
    }
}
