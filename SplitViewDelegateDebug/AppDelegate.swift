enum CodePath { case CrashesOnAllDevices ; case HappyPath}

//********** CHOSE CODE PATH HERE **********//
let path = CodePath.CrashesOnAllDevices
//********** CHOSE CODE PATH HERE **********//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        window = UIWindow(frame: UIScreen.mainScreen().bounds)

        //create a navigationcontroller for the master view
        let masterView = UIViewController(nibName: nil, bundle: nil)
        masterView.view.backgroundColor = UIColor.blueColor()
        let masterNav = UINavigationController(rootViewController: masterView)

        //create a navigation controller for the detail view
        let detailView = UIViewController(nibName: nil, bundle: nil)
        detailView.view.backgroundColor = UIColor.grayColor()
        let detailNav = UINavigationController(rootViewController: detailView)

        let svc = UISplitViewController(nibName: nil, bundle: nil)
        svc.viewControllers = [masterNav, detailNav]

if path == .CrashesOnAllDevices {
        // **crashes** on iPhone 6  (Portrait & Landscape)
        // **crashes** on iPhone 6+ (Portrait & Landscsape)
        // **crashes** on iPad Air (Portrait & Landscape)
        svc.delegate = SplitViewDelegate()
}

if path == .HappyPath {
    //if we set delegate to the AppDelegate then we are OK
    svc.delegate = self
}
        window?.rootViewController = svc
        window?.backgroundColor = UIColor.whiteColor()
        window?.makeKeyAndVisible()

        return true
    }

}

extension AppDelegate: UISplitViewControllerDelegate {

}

class SplitViewDelegate: UISplitViewControllerDelegate {


}