//
//  ConnectAAAARouter.swift
//  ICXOximeter
//
//  Created by fanrong on 2018/4/19.
//  Copyright © 2018年 fanrong. All rights reserved.
//

import RIBs

protocol ConnectAAAAInteractable: Interactable {
    weak var router: ConnectAAAARouting? { get set }
    weak var listener: ConnectAAAAListener? { get set }
}

protocol ConnectAAAAViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class ConnectAAAARouter: ViewableRouter<ConnectAAAAInteractable, ConnectAAAAViewControllable>, ConnectAAAARouting {

    // TODO: Constructor inject child builder protocols to allow building children.
    override init(interactor: ConnectAAAAInteractable, viewController: ConnectAAAAViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}
