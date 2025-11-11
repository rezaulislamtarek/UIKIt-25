import UIKit

extension UIView {
    func setDefultConstraints(view: UIView, height: CGFloat? = nil) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24)
        ])
        if let height = height {
            NSLayoutConstraint.activate([heightAnchor.constraint(equalToConstant: height)])
        }
    }

    @discardableResult
    func topToBottomOf(_ view: UIView, _ spacing: CGFloat = 8, alignCenterX: Bool = false) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false
        let constraint = topAnchor.constraint(equalTo: view.bottomAnchor, constant: spacing)
        constraint.isActive = true
        if alignCenterX {
            centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        }
        return constraint
    }

    @discardableResult
    func topToSafeArea(of view: UIView, _ spacing: CGFloat = 0, alignCenterX: Bool = false) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false
        let constraint = topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: spacing)
        constraint.isActive = true
        if alignCenterX {
            centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        }
        return constraint
    }

    @discardableResult
    func topToTopOf(_ view: UIView, _ spacing: CGFloat = 0, alignCenterX: Bool = false) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false
        let constraint = topAnchor.constraint(equalTo: view.topAnchor, constant: spacing)
        constraint.isActive = true
        if alignCenterX {
            centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        }
        return constraint
    }

    @discardableResult
    func bottomToTopOf(_ view: UIView, _ spacing: CGFloat = 8, alignCenterX: Bool = false) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false
        let constraint = bottomAnchor.constraint(equalTo: view.topAnchor, constant: -spacing)
        constraint.isActive = true
        if alignCenterX {
            centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        }
        return constraint
    }

    @discardableResult
    func bottomToBottomOf(_ view: UIView, _ spacing: CGFloat = 0, alignCenterX: Bool = false) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false
        let constraint = bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -spacing)
        constraint.isActive = true
        if alignCenterX {
            centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        }
        return constraint
    }

    @discardableResult
    func startToEndOf(_ view: UIView, _ spacing: CGFloat = 8, alignCenterY: Bool = false) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false
        let constraint = leadingAnchor.constraint(equalTo: view.trailingAnchor, constant: spacing)
        constraint.isActive = true
        if alignCenterY {
            centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        }
        return constraint
    }

    @discardableResult
    func startToStartOf(_ view: UIView, _ spacing: CGFloat = 0, alignCenterY: Bool = false) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false
        let constraint = leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: spacing)
        constraint.isActive = true
        if alignCenterY {
            centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        }
        return constraint
    }

    @discardableResult
    func endToStartOf(_ view: UIView, _ spacing: CGFloat = 0, alignCenterY: Bool = false) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false
        let constraint = trailingAnchor.constraint(equalTo: view.leadingAnchor, constant: -spacing)
        constraint.isActive = true
        if alignCenterY {
            centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        }
        return constraint
    }

    @discardableResult
    func endToEndOf(_ view: UIView, _ spacing: CGFloat = 0, alignCenterY: Bool = false) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false
        let constraint = trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: spacing)
        constraint.isActive = true
        if alignCenterY {
            centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        }
        return constraint
    }

    @discardableResult
    func centerXTo(_ view: UIView) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false
        let constraint = centerXAnchor.constraint(equalTo: view.centerXAnchor)
        constraint.isActive = true
        return constraint
    }

    @discardableResult
    func centerYTo(_ view: UIView) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false
        let constraint = centerYAnchor.constraint(equalTo: view.centerYAnchor)
        constraint.isActive = true
        return constraint
    }

    func setSize(width: CGFloat? = nil, height: CGFloat? = nil) {
        translatesAutoresizingMaskIntoConstraints = false
        var constraints: [NSLayoutConstraint] = []
        if let width = width {
            constraints.append(widthAnchor.constraint(equalToConstant: width))
        }
        if let height = height {
            constraints.append(heightAnchor.constraint(equalToConstant: height))
        }
        NSLayoutConstraint.activate(constraints)
    }
}
