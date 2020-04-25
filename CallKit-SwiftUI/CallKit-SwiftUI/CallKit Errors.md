#  CallKit Errors

## Error 1: `unentitled`

### Local description

`com.apple.CallKit.error.requesttransaction error 1.`

### Detail

The app isn’t entitled to perform the actions in the requested transaction.

### Cause

You most commonly receive this error code when the voip value is missing from the `UIBackgroundModes` array in your app's `Info.plist` file.

### Solution
To start VoIP service, you have to add capability for VoIP in background mode.

`Project Target` > `Signing & Capabilities` > `+ Capability` > add `Backround Modes` > check `Voice over IP`



## Error 2: `unknownCallProvider`

### Local description: 

`com.apple.CallKit.error.requesttransaction error 2.`

### Cause

The controller couldn’t find a call provider to perform the actions in the requested transaction.



## Error 3: `emptyTransaction`

### Local description: 

`com.apple.CallKit.error.requesttransaction error 3.`

### Cause

The requested transaction contains no actions.



## Error 4: `unknownCallUUID`

### Local description:

`com.apple.CallKit.error.requesttransaction error 4.`

### Cause

The requested transaction contains call actions that reference an unknown UUID.

### Solution

Store call's UUID some where to allow requested transaction contains valid call UUID.



## Error 5: `callUUIDAlreadyExists`

### Local description

`com.apple.CallKit.error.requesttransaction error 5.`

### Cause

The requested transaction contains call actions that reference a UUID that already exists.



## Error 6: `invalidAction`

### Local description

`com.apple.CallKit.error.requesttransaction error 6.`

### Cause

The requested transaction contains an invalid action.



## Error 7: `maximumCallGroupsReached`

### Local description

`com.apple.CallKit.error.requesttransaction error 7.`

### Cause

The requested transaction contains actions that, if performed, would exceed the maximum number of call groups for the provider.

### Solution

If you want to modify maximum number of call groups, use `CXProiderConfiguration`.  In this project, please see `CXProviderConfiguration+Sample.swift` file.
