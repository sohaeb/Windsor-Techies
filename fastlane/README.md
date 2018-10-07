fastlane documentation
================
# Installation

Make sure you have the latest version of the Xcode command line tools installed:

```
xcode-select --install
```

Install _fastlane_ using
```
[sudo] gem install fastlane -NV
```
or alternatively using `brew cask install fastlane`

# Available Actions
### provision
```
fastlane provision
```
Creating a code signing certificate and provisioning profile
### screenshot
```
fastlane screenshot
```
Take screenshots
### test
```
fastlane test
```
Runs all the tests
### patch
```
fastlane patch
```

### patch_minor
```
fastlane patch_minor
```

### patch_major
```
fastlane patch_major
```

### build
```
fastlane build
```
Create ipa
### release
```
fastlane release
```


----

This README.md is auto-generated and will be re-generated every time [fastlane](https://fastlane.tools) is run.
More information about fastlane can be found on [fastlane.tools](https://fastlane.tools).
The documentation of fastlane can be found on [docs.fastlane.tools](https://docs.fastlane.tools).
