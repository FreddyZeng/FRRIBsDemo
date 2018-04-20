//
//  ConnectBBBBBuilder.swift
//  ICXOximeter
//
//  Created by fanrong on 2018/4/20.
//  Copyright © 2018年 fanrong. All rights reserved.
//

import RIBs

protocol ConnectBBBBDependency: Dependency {
    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    // created by this RIB.
}

final class ConnectBBBBComponent: Component<EmptyComponent>, ConnectBBBBDependency {
    init() {
        super.init(dependency: EmptyComponent())
    }
    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
}

// MARK: - Builder

protocol ConnectBBBBBuildable: Buildable {
    func build(withListener listener: ConnectBBBBListener) -> ConnectBBBBRouting
}

final class ConnectBBBBBuilder: Builder<ConnectBBBBDependency>, ConnectBBBBBuildable {

    override init(dependency: ConnectBBBBDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: ConnectBBBBListener) -> ConnectBBBBRouting {
//        let component = ConnectBBBBComponent()
        let viewController = ConnectBBBBViewController()
        let interactor = ConnectBBBBInteractor(presenter: viewController)
        interactor.listener = listener
        return ConnectBBBBRouter(interactor: interactor, viewController: viewController)
    }
}
