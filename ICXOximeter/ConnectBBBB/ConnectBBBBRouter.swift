//
//  ConnectBBBBRouter.swift
//  ICXOximeter
//
//  Created by fanrong on 2018/4/20.
//  Copyright © 2018年 fanrong. All rights reserved.
//

import RIBs

protocol ConnectBBBBInteractable: Interactable {
    weak var router: ConnectBBBBRouting? { get set }
    weak var listener: ConnectBBBBListener? { get set }
}

protocol ConnectBBBBViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class ConnectBBBBRouter: ViewableRouter<ConnectBBBBInteractable, ConnectBBBBViewControllable>, ConnectBBBBRouting {

    // TODO: Constructor inject child builder protocols to allow building children.
    override init(interactor: ConnectBBBBInteractable, viewController: ConnectBBBBViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}
