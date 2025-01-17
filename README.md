# Women Wear Weekly Products

iPhone app in Swift that presents one view controller containing a table view that shows a list of products. When an item of the list is selected, display a Detail Screen with the basic information of the Product (name, price and expanded image).

<p align="center">
  <img width=35% src="https://github.com/Raphzz/MatchesFashionAssignment/blob/main/ProductList.png" />
</p>

## Table of Contents

- [About](#about)
- [Quick Start](#quick-start)
- [Features](#features)
- [Frameworks](#Frameworks)

## About

This mobile application is built using Swift 5.4 and Xcode 12.5.1 for iOS devices running iOS 14.

If attempting to run this code on future versions of Swift, Xcode, or iOS some additional work may be required to get this code running smoothly.

## Quick Start

The following steps will guide you through the process of running this application on your local machine, and device.

1. Checkout this repository
2. Open `MatchesFashionAssignment.xcodeproj` with Xcode
3. Go to the project settings, and change the code signing team to your own
4. Wait for the Swift Packages to download if not.

Code signing settings are left at automatic here for simplicity, you can set these to manual if needed but these steps will not take you through that process.

7. Attach an iPhone running iOS 14
8. Ensure the iPhone has development mode enabled, from the Devices & Simulators window: <kbd>Cmd</kbd> + <kbd>Shift</kbd> + <kbd>2</kbd>
9. Clean, build and run the application on an iPhone running iOS 14

## Features

Below is the set of user stories that outline the intended functionality of this mobile application.

## Offline Mode - Technical Implementation Spec

I will now describe a brief tehnical solution to implement Offline mode on this assignment.

1. I would start by creating a CacheManager class, which will also have a Protocol for functions called "save" and "get".
2. These two methods would access UserDefaults properties inside the device to fetch or save Model objects from the responses.
3. I would achiev full support on Offline with just 2 methods by utilizing Generics (e.g. <T: Codable>).
4. This CacheManager would be inject across all Service classes.
5. During the fetch process of the API, if the User encounters an error or if the App is offline, I would point it to CacheManager "get" function.
6. If API request is successful and user is fully online, save Codable class inside UserDefaults (e.g. cacheManager.save<T: Codable>(Codable.self, collectionOfModelItems))

### User Stories
- New Week Product list
- Clean code, Architecture MVVM+C Pattern - Use of Delegates
- Programmatic UI with SnapKit
- Network Layer & Parsing
- Unit Tests

## Frameworks

[SnapKit](http://snapkit.io)

[SDWebImage](https://github.com/SDWebImage/SDWebImage)
