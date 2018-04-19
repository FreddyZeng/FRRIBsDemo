//
//  ICXOximeterRootBuilder.swift
//  ICXOximeter
//
//  Created by fanrong on 2018/4/19.
//  Copyright © 2018年 fanrong. All rights reserved.
//

import RIBs

protocol ICXOximeterRootDependency: Dependency {
    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    // created by this RIB.
}

final class ICXOximeterRootComponent: Component<EmptyDependency>, ICXOximeterRootDependency {

    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
    init() {
        super.init(dependency: EmptyComponent())
    }
}

// MARK: - Builder

protocol ICXOximeterRootBuildable: Buildable {
    func build(withListener listener: ICXOximeterRootListener) -> ICXOximeterRootRouting
}

final class ICXOximeterRootBuilder: Builder<ICXOximeterRootDependency>, ICXOximeterRootBuildable {

    override init(dependency: ICXOximeterRootDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: ICXOximeterRootListener) -> ICXOximeterRootRouting {
//        let component = ICXOximeterRootComponent()
        let viewController = ICXOximeterRootViewController()
        let interactor = ICXOximeterRootInteractor(presenter: viewController)
        interactor.listener = listener
        return ICXOximeterRootRouter(interactor: interactor, viewController: viewController)
    }
}
