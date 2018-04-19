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
    func addTabbarViewControllers(viewControllers: [UIViewController])
}

final class ICXOximeterTabbarRouter: ViewableRouter<ICXOximeterTabbarInteractable, ICXOximeterTabbarViewControllable>, ICXOximeterTabbarRouting {

    // TODO: Constructor inject child builder protocols to allow building children.
    override init(interactor: ICXOximeterTabbarInteractable, viewController: ICXOximeterTabbarViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
    
    override func didLoad() {
        super.didLoad()
    }
    
    func addBarItem() {
        let firstBuilder = TabbarFirstBuilder(dependency: TabbarFirstComponent())
        let secondBuilder = TabbarSecondBuilder(dependency: TabbarSecondComponent())
        let firstRouting = firstBuilder.build(withListener: self)
        let secondRouting = secondBuilder.build(withListener: self)
        attachChild(firstRouting)
        attachChild(secondRouting)
        viewController.addTabbarViewControllers(viewControllers: [firstRouting.viewControllable.uiviewController,secondRouting.viewControllable.uiviewController])
    }
}

// MARK: TabbarFirstListener
extension ICXOximeterTabbarRouter: TabbarFirstListener {
    func pushContect() {
        
    }
}

// MARK: TabbarSecondListener
extension ICXOximeterTabbarRouter: TabbarSecondListener {
    
}
