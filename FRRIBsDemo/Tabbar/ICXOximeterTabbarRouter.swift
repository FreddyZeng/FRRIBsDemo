//
//  FRRIBsDemoTabbarRouter.swift
//  FRRIBsDemo
//
//  Created by fanrong on 2018/4/19.
//  Copyright © 2018年 fanrong. All rights reserved.
//

import RIBs

protocol FRRIBsDemoTabbarInteractable: Interactable {
    weak var router: FRRIBsDemoTabbarRouting? { get set }
    weak var listener: FRRIBsDemoTabbarListener? { get set }
}

protocol FRRIBsDemoTabbarViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
    func addTabbarViewControllers(viewControllers: [UIViewController])
}

final class FRRIBsDemoTabbarRouter: ViewableRouter<FRRIBsDemoTabbarInteractable, FRRIBsDemoTabbarViewControllable>, FRRIBsDemoTabbarRouting {

    // TODO: Constructor inject child builder protocols to allow building children.
    override init(interactor: FRRIBsDemoTabbarInteractable, viewController: FRRIBsDemoTabbarViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
    
    func addBarItem() {
        let firstBuilder = TabbarFirstBuilder(dependency: TabbarFirstComponent())
        let secondBuilder = TabbarSecondBuilder(dependency: TabbarSecondComponent())
        let firstRouting = firstBuilder.build(withListener: self)
        let secondRouting = secondBuilder.build(withListener: self)
        attachChild(firstRouting)
        attachChild(secondRouting)
        firstRouting.viewControllable.uiviewController.title = firstRouting.viewControllable.uiviewController.getClassName()
        secondRouting.viewControllable.uiviewController.title = secondRouting.viewControllable.uiviewController.getClassName()
        viewController.addTabbarViewControllers(viewControllers: [firstRouting.viewControllable.uiviewController,secondRouting.viewControllable.uiviewController])
    }
}

// MARK: TabbarFirstListener
extension FRRIBsDemoTabbarRouter: TabbarFirstListener {
    func pushContect() {
        
    }
}

// MARK: TabbarSecondListener
extension FRRIBsDemoTabbarRouter: TabbarSecondListener {
    
}
