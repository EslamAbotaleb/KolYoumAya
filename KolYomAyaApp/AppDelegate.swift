//
//  AppDelegate.swift
//  KolYomAyaApp
//
//  Created by Islam Abotaleb on 7/24/20.
//  Copyright © 2020 Islam Abotaleb. All rights reserved.
//

import UIKit
import AVFoundation
let appDelegate = UIApplication.shared.delegate as! AppDelegate

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    var appCoordinator: AppCoordinator?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
               let audioSession = AVAudioSession.sharedInstance()
               do {
                   try audioSession.setCategory(AVAudioSession.Category.playback, mode: AVAudioSession.Mode.default)
               } catch let error as NSError {
                   print("Setting category to AVAudioSessionCategoryPlayback failed: \(error)")
               }
        window?.rootViewController = nil
        UIViewController.swizzlePresent()
        
        Localizer.DoTheSwizzling()
        Localizer.setDefaultLanguage()
        window = UIWindow(frame: UIScreen.main.bounds)
        
        window?.makeKeyAndVisible()
        self.appCoordinator = AppCoordinator(window: window!)
        appCoordinator?.start()
        
        return true
    }
//    func setupSideMenu(viewNavigationContoller: UINavigationController) -> UIViewController {
//        let sideMenuController = PGSideMenu(animationType: .slideOver)
//        sideMenuController.addContentController(viewNavigationContoller)
//        sideMenuController.hideMenu(animated: false)
//        sideMenuController.isLeftMenu = Localizer.isArabic()
//        let rightMenuController = SideMenuViewController()
//        sideMenuController.addRightMenuController(rightMenuController)
//        let leftMenuController = SideMenuViewController()
//        sideMenuController.addLeftMenuController(leftMenuController)
//        return sideMenuController
//    }
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any]) {
        
    }
    
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    //    // MARK: UISceneSession Lifecycle
    //
    //    @available(iOS 13.0, *)
    //    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
    //        // Called when a new scene session is being created.
    //        // Use this method to select a configuration to create the new scene with.
    //        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    //    }
    //    @available(iOS 13.0, *)
    //    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
    //        // Called when the user discards a scene session.
    //        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    //        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    //    }
    
    
}
