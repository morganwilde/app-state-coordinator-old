### App State Coordinator

##### Structure

```
AppStateCoordinator\
	AppStateCoordinator.swift
	AppState.swift
	AppStates\
		FirstAppState.swift
		SecondAppState.swift	
		ThirdAppState.swift
		FourthAppState.swift			
```

##### Usage

`AppStateCoordinator` guides the application to a specific state. A state is defined as a view controller at a certain point in its lifecycle. To define a custom state, you need to 

1. Inherit from `AppState`
2. Implement `init()`
3. Call `super.init(finalStep:)` with the desired step counter
4. Set `viewController` to a view controller that inherits at some point from `StatefulViewController`
5. Do any kind of setup on the view controller

```Swift
class SecondAppState: AppState {
	init() {
		super.init(finalStep: 2)
		let mainStoryboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
		viewController = mainStoryboard.instantiateViewControllerWithIdentifier("SecondViewController") as? SecondViewController
	}
}
```

The `finalStep` is by default set to `1`, which is set during `viewDidAppear(_:)`. Initialize `finalStep` to a specific step within the view controllers lifecycle. And then after each step, like fetching api data, increment the step number by calling `appState?.step()`.

```Swift
class SecondViewController: StatefulViewController {
	override func viewDidLoad() {
		super.viewDidLoad()
	    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
			sleep(2)
			self.appState?.step()
		}
	}
}
```


To start the application with a specific sequence of states, assign to the `states` variable of the shared `AppStateCoordinator` instance a list of `AppState` instances. This needs to be done in `
application(_:didFinishLaunchingWithOptions:)` method body.

```Swift
func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
    
	AppStateCoordinator.shared.states = [
		FirstAppState(),
		SecondAppState(),.
		ThirdAppState(),
	]
	
	return true
}
```

