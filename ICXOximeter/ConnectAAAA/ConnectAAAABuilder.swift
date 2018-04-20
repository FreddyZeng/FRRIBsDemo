//
//  ConnectAAAABuilder.swift
//  ICXOximeter
//
//  Created by fanrong on 2018/4/19.
//  Copyright © 2018年 fanrong. All rights reserved.
//

import RIBs

protocol ConnectAAAADependency: Dependency {
    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    // created by this RIB.
}

final class ConnectAAAAComponent: Component<EmptyComponent>, ConnectAAAADependency {

    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
    init() {
        super.init(dependency: EmptyComponent())
    }
}

// MARK: - Builder

protocol ConnectAAAABuildable: Buildable {
    func build(withListener listener: ConnectAAAAListener) -> ConnectAAAARouting
}

final class ConnectAAAABuilder: Builder<ConnectAAAADependency>, ConnectAAAABuildable {
    func build(withListener listener: ConnectAAAAListener) -> ConnectAAAARouting {
        return build(withListener: listener, navigationController: nil)
    }

    override init(dependency: ConnectAAAADependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: ConnectAAAAListener, navigationController:UINavigationController?) -> ConnectAAAARouting {
//        let component = ConnectAAAAComponent()
        let viewController = ConnectAAAAViewController()
        if let navigation = navigationController {
            navigation.viewControllers = [viewController]
        }
        let interactor = ConnectAAAAInteractor(presenter: viewController)
        interactor.listener = listener
        return ConnectAAAARouter(interactor: interactor, viewController: viewController)
    }
}
