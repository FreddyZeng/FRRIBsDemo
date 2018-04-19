//
//  ICXOximeterRootRouter.swift
//  ICXOximeter
//
//  Created by fanrong on 2018/4/19.
//  Copyright © 2018年 fanrong. All rights reserved.
//

import RIBs

protocol ICXOximeterRootInteractable: Interactable {
    weak var router: ICXOximeterRootRouting? { get set }
    weak var listener: ICXOximeterRootListener? { get set }
}

protocol ICXOximeterRootViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class ICXOximeterRootRouter: LaunchRouter<ICXOximeterRootInteractable, ICXOximeterRootViewControllable>, ICXOximeterRootRouting {

    // TODO: Constructor inject child builder protocols to allow building children.
    override init(interactor: ICXOximeterRootInteractable, viewController: ICXOximeterRootViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}
