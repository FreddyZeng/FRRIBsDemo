//
//  FRRIBsDemoRootRouter.swift
//  FRRIBsDemo
//
//  Created by fanrong on 2018/4/19.
//  Copyright © 2018年 fanrong. All rights reserved.
//

import RIBs

protocol FRRIBsDemoRootInteractable: Interactable {
    weak var router: FRRIBsDemoRootRouting? { get set }
    weak var listener: FRRIBsDemoRootListener? { get set }
}

protocol FRRIBsDemoRootViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
    func addViewController(viewController: UIViewController)
}

final class FRRIBsDemoRootRouter: LaunchRouter<FRRIBsDemoRootInteractable, FRRIBsDemoRootViewControllable>, FRRIBsDemoRootRouting {
    
    // TODO: Constructor inject child builder protocols to allow building children.
    override init(interactor: FRRIBsDemoRootInteractable, viewController: FRRIBsDemoRootViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
    
    func routToTabbar() {
        let tabbar = FRRIBsDemoTabbarBuilder.init(dependency: FRRIBsDemoTabbarComponent())
        let router:ViewableRouting = tabbar.build(withListener: self)
        attachChild(router)
        
        viewController.addViewController(viewController: router.viewControllable.uiviewController)
    }
}

extension FRRIBsDemoRootRouter: FRRIBsDemoTabbarListener {
    
}
