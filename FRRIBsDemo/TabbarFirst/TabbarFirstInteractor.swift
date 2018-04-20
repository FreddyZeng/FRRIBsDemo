//
//  TabbarFirstInteractor.swift
//  FRRIBsDemo
//
//  Created by fanrong on 2018/4/19.
//  Copyright © 2018年 fanrong. All rights reserved.
//

import RIBs
import RxSwift

protocol TabbarFirstRouting: ViewableRouting {
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
    func routingContect()
}

protocol TabbarFirstPresentable: Presentable {
    weak var listener: TabbarFirstPresentableListener? { get set }
    // TODO: Declare methods the interactor can invoke the presenter to present data.
}

protocol TabbarFirstListener: class {
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
}

final class TabbarFirstInteractor: PresentableInteractor<TabbarFirstPresentable>, TabbarFirstInteractable, TabbarFirstPresentableListener {

    weak var router: TabbarFirstRouting?
    weak var listener: TabbarFirstListener?

    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    override init(presenter: TabbarFirstPresentable) {
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

extension TabbarFirstInteractor {
    func didClickButton() {
        self.router?.routingContect()
    }
}
