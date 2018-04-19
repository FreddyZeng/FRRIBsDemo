//
//  TabbarFirstRouter.swift
//  ICXOximeter
//
//  Created by fanrong on 2018/4/19.
//  Copyright © 2018年 fanrong. All rights reserved.
//

import RIBs

protocol TabbarFirstInteractable: Interactable {
    weak var router: TabbarFirstRouting? { get set }
    weak var listener: TabbarFirstListener? { get set }
}

protocol TabbarFirstViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class TabbarFirstRouter: ViewableRouter<TabbarFirstInteractable, TabbarFirstViewControllable>, TabbarFirstRouting {

    // TODO: Constructor inject child builder protocols to allow building children.
    override init(interactor: TabbarFirstInteractable, viewController: TabbarFirstViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}
