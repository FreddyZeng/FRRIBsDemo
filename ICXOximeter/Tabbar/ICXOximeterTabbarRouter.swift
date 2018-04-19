//
//  ICXOximeterTabbarRouter.swift
//  ICXOximeter
//
//  Created by fanrong on 2018/4/19.
//  Copyright © 2018年 fanrong. All rights reserved.
//

import RIBs

protocol ICXOximeterTabbarInteractable: Interactable {
    weak var router: ICXOximeterTabbarRouting? { get set }
    weak var listener: ICXOximeterTabbarListener? { get set }
}

protocol ICXOximeterTabbarViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class ICXOximeterTabbarRouter: ViewableRouter<ICXOximeterTabbarInteractable, ICXOximeterTabbarViewControllable>, ICXOximeterTabbarRouting {

    // TODO: Constructor inject child builder protocols to allow building children.
    override init(interactor: ICXOximeterTabbarInteractable, viewController: ICXOximeterTabbarViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}
