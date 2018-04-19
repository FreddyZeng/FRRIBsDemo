//
//  ICXOximeterTabbarBuilder.swift
//  ICXOximeter
//
//  Created by fanrong on 2018/4/19.
//  Copyright © 2018年 fanrong. All rights reserved.
//

import RIBs

protocol ICXOximeterTabbarDependency: Dependency {
    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    // created by this RIB.
}

final class ICXOximeterTabbarComponent: Component<EmptyComponent>, ICXOximeterTabbarDependency {

    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
    init() {
        super.init(dependency: EmptyComponent())
    }
}

// MARK: - Builder

protocol ICXOximeterTabbarBuildable: Buildable {
    func build(withListener listener: ICXOximeterTabbarListener) -> ICXOximeterTabbarRouting
}

final class ICXOximeterTabbarBuilder: Builder<ICXOximeterTabbarDependency>, ICXOximeterTabbarBuildable {

    override init(dependency: ICXOximeterTabbarDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: ICXOximeterTabbarListener) -> ICXOximeterTabbarRouting {
//        let componeICXOximeterTabbarListenernt = ICXOximeterTabbarComponent()
        let viewController = ICXOximeterTabbarViewController()
        let interactor = ICXOximeterTabbarInteractor(presenter: viewController)
        interactor.listener = listener
        return ICXOximeterTabbarRouter(interactor: interactor, viewController: viewController)
    }
}
