//
//  FRRIBsDemoRootBuilder.swift
//  FRRIBsDemo
//
//  Created by fanrong on 2018/4/19.
//  Copyright © 2018年 fanrong. All rights reserved.
//

import RIBs

protocol FRRIBsDemoRootDependency: Dependency {
    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    // created by this RIB.
}

final class FRRIBsDemoRootComponent: Component<EmptyDependency>, FRRIBsDemoRootDependency {

    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
    init() {
        super.init(dependency: EmptyComponent())
    }
}

// MARK: - Builder

protocol FRRIBsDemoRootBuildable: Buildable {
    func build(withListener listener: FRRIBsDemoRootListener) -> FRRIBsDemoRootRouting
}

final class FRRIBsDemoRootBuilder: Builder<FRRIBsDemoRootDependency>, FRRIBsDemoRootBuildable {

    override init(dependency: FRRIBsDemoRootDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: FRRIBsDemoRootListener) -> FRRIBsDemoRootRouting {
//        let component = FRRIBsDemoRootComponent()
        let viewController = FRRIBsDemoRootViewController()
        let interactor = FRRIBsDemoRootInteractor(presenter: viewController)
        interactor.listener = listener
        return FRRIBsDemoRootRouter(interactor: interactor, viewController: viewController)
    }
}
