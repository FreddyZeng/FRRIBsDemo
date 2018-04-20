//
//  TabbarSecondInteractor.swift
//  FRRIBsDemo
//
//  Created by fanrong on 2018/4/19.
//  Copyright © 2018年 fanrong. All rights reserved.
//

import RIBs
import RxSwift

protocol TabbarSecondRouting: ViewableRouting {
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
}

protocol TabbarSecondPresentable: Presentable {
    weak var listener: TabbarSecondPresentableListener? { get set }
    // TODO: Declare methods the interactor can invoke the presenter to present data.
}

protocol TabbarSecondListener: class {
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
}

final class TabbarSecondInteractor: PresentableInteractor<TabbarSecondPresentable>, TabbarSecondInteractable, TabbarSecondPresentableListener {

    weak var router: TabbarSecondRouting?
    weak var listener: TabbarSecondListener?

    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    override init(presenter: TabbarSecondPresentable) {
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
