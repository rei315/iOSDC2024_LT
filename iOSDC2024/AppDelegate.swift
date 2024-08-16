import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let homeView = HomeViewController()
        let textKitProblemVC = TextKitProblemViewController()
        let autoLayoutProblemVC = AutoLayoutProblemViewController()
        let asyncImageVC = AsyncImageProblemViewController()
        textKitProblemVC.tabBarItem = .init(
            title: "TextKit",
            image: .init(
                systemName: "1.circle"
            ),
            selectedImage: .init(
                systemName: "1.circle.fill"
            )
        )
        autoLayoutProblemVC.tabBarItem = .init(
            title: "AuthLayout",
            image: .init(
                systemName: "2.circle"
            ),
            selectedImage: .init(
                systemName: "2.circle.fill"
            )
        )
        asyncImageVC.tabBarItem = .init(
            title: "AsyncImage",
            image: .init(
                systemName: "3.circle"
            ),
            selectedImage: .init(
                systemName: "3.circle.fill"
            )
        )
        homeView.viewControllers = [
            textKitProblemVC,
            autoLayoutProblemVC,
            asyncImageVC
        ]
        window?.rootViewController = homeView
        window?.makeKeyAndVisible()
        return true
    }
}

