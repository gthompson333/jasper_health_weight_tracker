# Jasper Health Weight Tracker

<p class='center'>
The Jasper Health Weight Tracker app is a simple Flutter app that tracks a user's weight.

The app utilizes Google's Firebase Auth and Cloud Firestore platforms to authorize users and
store the weight data.
</p>

# Platform Support

| Android | iOS | web |
| :-----: | :-: | :-: |
|   ✅    | ✅ |  ✅ |

# Features

On first launch, the app lets users sign-in with Firebase. 
For simplicity, all sign-ins are anonymous.

After sign-in, the app shows an empty weight entry list and a button to allow the user to enter a new weight entry
and submit it for upload to Google Cloud Firestore.

Along with the weight value, the entry time and date is recorded and sent up to Firestore, as well.

All weight entries are associated with the logged-in user and only the logged-in user's weight entries
will appear in the list.

All weight entries are sorted by recent date / time, with the most recent entry at the top of the list.

The app utilizes Google Cloud Firestore to update data in real-time, as the data changes.

In addition, by tapping on an existing entry, the weight value can be edited and updated.

By swiping an entry to the left, an entry can be deleted.

In the upper, left of the app screen, is an icon button to allow the user to sign out.

# To Build and Run

To build and run the app, one need only clone the GitHub repo here:
https://github.com/gthompson333/jasper_health_weight_tracker

Open the Flutter project in your IDE of choice. I use Android Studio.
Select either an Android emulator, iOS simulator, or web target.
Hit the 'run' button or 'flutter run' in a command terminal window.

# Demo video
Within the Flutter project, you will find a video file which I recorded to demonstrate the app.

# Design and Assumptions
For this simple coding assessment project, I did not implement many features, such as input validation
logic, that I would normally implement for a production-ready app.

This app design is a simple two-layered architecture.
A data layer with data model classes.
A UI layer with screens and widgets.

For a much larger, production-ready app, I would most likely include a view-model business layer
which encapsulates business logic and rules, and also data formatting that is appropriate for
the UI layer.

In addition, I did not create any special UI theming, layout, or custom widgets, that I would normally
would for a production-ready app.



