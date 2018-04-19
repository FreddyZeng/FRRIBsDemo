//
//  TabbarSecondBuilder.swift
//  ICXOximeter
//
//  Created by fanrong on 2018/4/19.
//  Copyright © 2018年 fanrong. All rights reserved.
//

import RIBs

protocol TabbarSecondDependency: Dependency {
    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    // created by this RIB.
}

final class TabbarSecondComponent: Component<EmptyComponent>, TabbarSecondDependency {

    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
    init() {
        super.init(dependency: EmptyComponent())
    }
}

// MARK: - Builder

protocol TabbarSecondBuildable: Buildable {
    func build(withListener listener: TabbarSecondListener) -> TabbarSecondRouting
}

final class TabbarSecondBuilder: Builder<TabbarSecondDependency>, TabbarSecondBuildable {

    override init(dependency: TabbarSecondDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: TabbarSecondListener) -> TabbarSecondRouting {
//        let component = TabbarSecondComponent(dependency: dependency)
        let viewController = TabbarSecondViewController()
        let interactor = TabbarSecondInteractor(presenter: viewController)
        interactor.listener = listener
        return TabbarSecondRouter(interactor: interactor, viewController: viewController)
    }
}
