//
//  TabbarFirstRouter.swift
//  FRRIBsDemo
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
    
    func routingContect() {
        let builder = ConnectAAAABuilder(dependency: ConnectAAAAComponent())
        let nav = UINavigationController()
        let routing = builder.build(withListener: self, navigationController: nav)
        attachChild(routing)
//        viewController.uiviewController.present(nav, animated: true, completion: nil)
        if let rootVC = viewControllable.uiviewController.view.window?.rootViewController {
            rootVC.present(nav, animated: true, completion: nil)
        }
    }
}


// MARK: ConnectAAAAListener
extension TabbarFirstRouter: ConnectAAAAListener {
    func didFinish() {
        if let last = children.last as? ViewableRouting {
            detachChild(last)
            last.viewControllable.uiviewController.dismiss(animated: true, completion: nil)
        }
    }
}
