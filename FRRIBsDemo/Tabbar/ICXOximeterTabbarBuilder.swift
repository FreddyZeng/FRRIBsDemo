//
//  FRRIBsDemoTabbarBuilder.swift
//  FRRIBsDemo
//
//  Created by fanrong on 2018/4/19.
//  Copyright © 2018年 fanrong. All rights reserved.
//

import RIBs

protocol FRRIBsDemoTabbarDependency: Dependency {
    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    // created by this RIB.
}

final class FRRIBsDemoTabbarComponent: Component<EmptyComponent>, FRRIBsDemoTabbarDependency {

    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
    init() {
        super.init(dependency: EmptyComponent())
    }
}

// MARK: - Builder

protocol FRRIBsDemoTabbarBuildable: Buildable {
    func build(withListener listener: FRRIBsDemoTabbarListener) -> FRRIBsDemoTabbarRouting
}

final class FRRIBsDemoTabbarBuilder: Builder<FRRIBsDemoTabbarDependency>, FRRIBsDemoTabbarBuildable {

    override init(dependency: FRRIBsDemoTabbarDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: FRRIBsDemoTabbarListener) -> FRRIBsDemoTabbarRouting {
//        let componeFRRIBsDemoTabbarListenernt = FRRIBsDemoTabbarComponent()
        let viewController = FRRIBsDemoTabbarViewController()
        let interactor = FRRIBsDemoTabbarInteractor(presenter: viewController)
        interactor.listener = listener
        return FRRIBsDemoTabbarRouter(interactor: interactor, viewController: viewController)
    }
}
