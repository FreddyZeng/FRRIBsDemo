//
//  TabbarFirstBuilder.swift
//  ICXOximeter
//
//  Created by fanrong on 2018/4/19.
//  Copyright © 2018年 fanrong. All rights reserved.
//

import RIBs

protocol TabbarFirstDependency: Dependency {
    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    // created by this RIB.
}

final class TabbarFirstComponent: Component<TabbarFirstDependency> {

    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
}

// MARK: - Builder

protocol TabbarFirstBuildable: Buildable {
    func build(withListener listener: TabbarFirstListener) -> TabbarFirstRouting
}

final class TabbarFirstBuilder: Builder<TabbarFirstDependency>, TabbarFirstBuildable {

    override init(dependency: TabbarFirstDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: TabbarFirstListener) -> TabbarFirstRouting {
        let component = TabbarFirstComponent(dependency: dependency)
        let viewController = TabbarFirstViewController()
        let interactor = TabbarFirstInteractor(presenter: viewController)
        interactor.listener = listener
        return TabbarFirstRouter(interactor: interactor, viewController: viewController)
    }
}