# Fingerly for iOS: privacy and App Store answers

This page covers version 0.2.0. It describes what the SDK collects, what
its privacy manifest declares, and how to answer the App Store privacy
questions for it. Your app's own data collection is yours to add.

## What the SDK sends

Nothing is collected or sent until your app sets consent to `.granted`. After
that, each identification sends one report to Fingerly over HTTPS. It contains:

- **A random installation identifier.** By default it is kept in a file inside
  your app's container, so it is deleted when the app is deleted. It is not
  derived from the device. See [Reinstall](#reinstall) for the opt-in that
  keeps it across reinstall.
- **Install facts:** how many times the app has launched, and the install's
  age in hours. The app container's age is sent in whole days.
- **Device and OS facts for integrity checks:** the model identifiers, OS
  version and build, screen geometry, and whether the device is a simulator.
- **Security checks:**
  - signs of a jailbreak, a debugger, hooking or instrumentation;
  - whether a passcode is set, and why biometry is unusable when it is;
  - whether the accelerometer and gyroscope exist;
  - the TLS certificate chain the device sees for Fingerly's API;
  - App Attest evidence, when your app has the capability.
- **Network facts:** the transport (Wi-Fi, cellular or wired), the interface
  types in use, whether a proxy is configured, and how many cellular services
  are active. No IP address, MAC address or carrier is read on the device.
- **Locale and time zone:** the time zone and the locale's language and
  region. Fingerly compares them with the location its server derives from
  the IP address.
- **Your app:** its bundle ID, version and signing facts.

What the SDK does not read or send:

- battery, brightness or dark mode;
- accessibility settings;
- fonts or the audio route;
- the preferred-language list;
- calendar, currency or number formats;
- memory size, or CPU and cache details;
- boot time, uptime or disk space;
- the advertising identifier;
- the vendor identifier (IDFV);
- any other app's name.

It reads nothing outside your app's container. The jailbreak checks only test
whether fixed paths exist.

**The device is never identified from these measurements.** Fingerly recognises
an installation by its random identifier only. It uses everything else to judge
whether the device and the app are genuine. Nothing is linked with data from
other companies' apps, and nothing is used for advertising.

## Privacy manifest

`PrivacyInfo.xcprivacy` ships inside every slice of the framework, so Xcode
adds it to your app's privacy report. It declares:

| Data type | Linked to the user | Tracking | Purpose | What it covers |
|---|---|---|---|---|
| Device ID | Yes | No | App Functionality | the installation identifier and the App Attest key ID |
| Coarse Location | Yes | No | App Functionality | the time zone and locale region, and the location Fingerly derives from the IP address |
| Product Interaction | Yes | No | App Functionality | launch count, install age, container age |
| Other Diagnostic Data | Yes | No | App Functionality | device model, OS, integrity, jailbreak, simulator, debugger and network-type checks |

`NSPrivacyTracking` is `false`, and there are no tracking domains. The one
required-reason API the SDK uses is file timestamps, with reason `C617.1`. It
is used to read the creation date of your app's own `Library` directory.

"Linked to the user" is answered Yes. Apple treats personal data as linked,
and the installation identifier is personal data once your backend ties it to
an account.

## App Store privacy questions

These answers cover the Fingerly SDK only. Add your app's other collection to
them.

- **Do you or your third-party partners collect data from this app?** Yes.
- **For each type in the manifest table:** collected, linked to the user, not
  used for tracking, purpose App Functionality. Apple defines App
  Functionality to include "prevent fraud, implement security measures".

Text you can adapt for your privacy policy, which Guideline 5.1.1(i) asks for:

> To protect [App name] and its users from fraud, we use Fingerly. After you
> consent, it collects a random installation identifier, your device model and
> operating system version, security checks (for example whether the device
> is jailbroken, emulated or tampered with), the type of network connection,
> your time zone and region, and an approximate location derived from your IP
> address. These are used only to detect fraud and secure the service. They
> are never used to identify your device from its characteristics, and never
> to track you across other companies' apps. You can ask us to delete them.

## Reinstall

By default the installation identifier lives exactly as long as the app.
Deleting the app deletes it, and a reinstall starts a new identifier that
nothing links to the old one. The record is excluded from backups and never
moves to another device. To detect reinstall abuse, prefer Apple's own
signals: the App Attest risk metric and DeviceCheck.

On tvOS, which gives apps no persistent storage outside a purgeable cache, no
identifier is kept by default: the `identity` check reports `unsupported`
rather than a new identifier on every launch.

If you need one installation identifier across reinstalls on the same device,
add this to your app's `Info.plist`:

```xml
<key>FingerlyPersistAcrossReinstall</key>
<true/>
```

The record then lives in the keychain, where it stays after the app is
deleted. This option is a stopgap until DeviceCheck is available through
Fingerly, and it may be deprecated then. If you turn it on:

- Say so in your privacy policy, for example: "Fingerly stores a random
  installation identifier in the device's keychain and sends it to Fingerly
  with each fraud-check report, so that [App name] can recognise a reinstall
  on the same device. Deleting the app does not delete it. [App name] deletes
  it when you delete your account or ask [App name] to."
- Call `Fingerly.deleteStoredIdentity()` when an account is deleted or an
  erasure request arrives.

## Erasure

`Fingerly.deleteStoredIdentity()` deletes the installation record in both
places it can be kept. It needs no client and works whatever the consent state
is. The next consented identification starts a new, unlinked identifier. Ask
Fingerly support to delete server-side data for an installation identifier.

## Verifying the framework

Every release from 0.2.0 onwards is meant to be signed with Fingerly's Apple
Distribution certificate. Until the certificate is in place, a release can
ship unsigned. To check a signed release, select `Fingerly.xcframework` in
Xcode's project navigator. The inspector names the team that signed it. Xcode
refuses an update signed by anyone else.
