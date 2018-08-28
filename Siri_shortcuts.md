# Siri Shortcuts

* Expose capabilities of apps to Siri



## Features

* Do the deeper things on the surface

* Use it on watch and on all iOS (HomePod)

* Right time & place: on lock screen

* Add it in Siri

* Provide custom response dialog




## Adopting Shortcuts

### Creating shortcuts

* Made NSUserActivity eligible for prediction (optional)

* Define Shortcut
  * What you want to expose
  * Define each one
* Donate Shortcut
  * Let Siri learn when and where to expose shortcut
* Handle shortcut
  * When user want to use shortcuts in Siri, lock screen, search
  * Be ready to be invaded and handle


### Key principle for shortcuts

* Accelerate the key function of app
* Persistent interest to user
* Be executable at any time

### Shortcuts API

#### NSUserActivity

* Lightweight way to represent status of apps 
* Open something in the app
* Show something that index in Spotlight or offer for Handoff 
* declare a type in NSUserActivityTypes in Info.plist

```
// Declare a type in NSUserActivityTypes in your Info.plist
// How to donate a shortcut
// How to handle a shortcut
```

#### Intents

* Run inline, without launching your app  
* Include custom voice response or a custom UI 
* Include granular predictions
* Create an intent definition file in Xcode to customize a built-in SiriKit intent  or define a new custom intent 

```
// Create your shortcut
// Donate your shortcut
// Handle your shortcut
```



## Optimizing for suggestions 

* NSUserActivity.requiredUserInfoKeys
  * Minimal amount of information necessary for restoration
  * Used to find patterns 
* Good Donation
  * Likely to be repeated
  * Ensure the payload you’re donating is consistent across donations
  * Don’t include timestamps
  * Donate once and only once for each user action 
* Custom Intents
  * Use enums when the values for a parameter are clearly bounded 
* "Custom" results in an INObject 
  * Combines an identifier with a display string
  * Identifier can reference an internal object
  * Display string conveys that object to the user
  * Prevents possible implicit dependencies between parameters
* Shortcut Display 
  * Understandable
  * Represent what will happen 
* Shortcut Testing 
  * Developer settings on device
  * Set up a shortcut with Siri and edit the Xcode scheme to test 
  * Create a custom shortcut in the Shortcuts app 



## Privacy  

* Deleting Donations 

  * User expectations
  * Prevent suggesting content that’s no longer relevant

* NSUserActivity

  * Deleting user activities with corresponding Spotlight items
  * Persistent identifier property on NSUserActivity

  * Use the identifier to later delete specific NSUserActivities 

  ```
  // Deleting NSUserActivity using persistent identifier
  ```

* Intent

  * Identifier and group identifier properties on INInteraction  
  * Use the identifier or group identifier to later delete one or more INInteractions 

  ```
  //Delete the donation
  ```


## Media shortcuts  

* INPlayMediaIntent
  * tell the system about new media the user hasn’t yet consumed 
* Launches app in background
* Suggested in playback controls on Lock Screen 
* Works on HomePod



## Adding shortcuts to Siri

* Provide the suggest phrase to user
* Confirm or not



## Custom responses

* Custom responses
  * Confirmation
  * Success
  * Information
  * Error

* Custom UI extension
  * Siri
  * Lock screen
  * Search

* Adpoting custom responces
  * Define a custom intent 
  * Select a category for your intent 
  * Declare response properties
  * Provide a response template string
  * Provide the response in your intent handler 



## Best practices for shortcuts 

### Customizing Donations

* Title: what happens when run
* Subtitle
* Image
* Suggested invocation phrase

### Basic guidelines

* Use sentence case
* Keep the title concise
* Include critical information
* Include a verb for Intents
* Localize 

### Things to Avoid in Title

* The name of your app
* Duplicate information in the title and subtitle 
* “Quotation marks” except when referring to strings that will be used verbatim in the shortcut 

```
// Setting an image on an NSUserActivity
// Setting an image on an INIntent
// Suggesting an invocation phrase on an NSUserActivity
// Suggesting an invocation phrase on an INIntent
```

### Choosing a Good Suggested Invocation Phrase 

* Short and memorable 
* Don’t include “Hey Siri” 

### Localization

* Not only in English

```
// How to suggest a shortcut for something a user hasn’t done yet
import Intents
```



## Bringing shortcuts into your app 

```
// Adding a shortcut from an NSUserActivity
// Adding a shortcut from an INIntent
```

 