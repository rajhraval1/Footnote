//
//  ViewControllerResolver.swift
//  Footnote
//
//  Created by Japneet Singh on /2610/20.
//  Copyright © 2020 Cameron Bardell. All rights reserved.
//

import SwiftUI

final class ViewControllerResolver: UIViewControllerRepresentable {
    let onResolve: (UIViewController) -> Void
    init(onResolve: @escaping (UIViewController) -> Void) {
        self.onResolve = onResolve
    }
    func makeUIViewController(context: Context) -> ParentResolverViewController {
        ParentResolverViewController(onResolve: onResolve)
    }
    func updateUIViewController(_ uiViewController: ParentResolverViewController, context: Context) { }
}

class ParentResolverViewController: UIViewController {
    let onResolve: (UIViewController) -> Void
    init(onResolve: @escaping (UIViewController) -> Void) {
        self.onResolve = onResolve
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("Use init(onResolve:) to instantiate ParentResolverViewController.")
    }
    override func didMove(toParent parent: UIViewController?) {
        super.didMove(toParent: parent)
        if let parent = parent {
            onResolve(parent)
        }
    }
}
