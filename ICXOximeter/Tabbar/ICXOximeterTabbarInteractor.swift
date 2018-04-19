//
//  ICXOximeterTabbarInteractor.swift
//  ICXOximeter
//
//  Created by fanrong on 2018/4/19.
//  Copyright © 2018年 fanrong. All rights reserved.
//

import RIBs
import RxSwift

protocol ICXOximeterTabbarRouting: ViewableRouting {
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
}

protocol ICXOximeterTabbarPresentable: Presentable {
    weak var listener: ICXOximeterTabbarPresentableListener? { get set }
    // TODO: Declare methods the interactor can invoke the presenter to present data.
}

protocol ICXOximeterTabbarListener: class {
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
}

final class ICXOximeterTabbarInteractor: PresentableInteractor<ICXOximeterTabbarPresentable>, ICXOximeterTabbarInteractable, ICXOximeterTabbarPresentableListener {

    weak var router: ICXOximeterTabbarRouting?
    weak var listener: ICXOximeterTabbarListener?

    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    override init(presenter: ICXOximeterTabbarPresentable) {
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
