//
//  TabbarSecondRouter.swift
//  FRRIBsDemo
//
//  Created by fanrong on 2018/4/19.
//  Copyright © 2018年 fanrong. All rights reserved.
//

import RIBs

protocol TabbarSecondInteractable: Interactable {
    weak var router: TabbarSecondRouting? { get set }
    weak var listener: TabbarSecondListener? { get set }
}

protocol TabbarSecondViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class TabbarSecondRouter: ViewableRouter<TabbarSecondInteractable, TabbarSecondViewControllable>, TabbarSecondRouting {

    // TODO: Constructor inject child builder protocols to allow building children.
    override init(interactor: TabbarSecondInteractable, viewController: TabbarSecondViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}
