# Flutter-Calculator
This is a simple calculator mobile application built on Flutter and Spring 📱 <br />
This guide was created by Hayden Hanson, Joshua Hilbert, Nicholas Thor Page and Willie Warren <br />

# Getting Started...
*If you get lost, check out Flutters official documentation at https://docs.flutter.dev/get-started/install and clicking on your OS* <br />

# Installation Guide for Windows

Step 1: Download Flutter SDK <br />

Here is the link: https://docs.flutter.dev/get-started/install/windows <br />
*Keep track of where you download this SDK, you will need to keep hold of the file path* <br />

Step 2: Update your PATH <br />

*This allows you to run Flutter commands from Command Prompt* <br />
1. To do this, go to the Start search bar and type in 'environment' and you should see *Edit the system environment variables* <br />
2. Click on 'Environment Variables... <br/>
3. Double click on 'Path' <br/>
4. Click 'Edit...' <br/>
5. Click 'New' <br/>
6. Now, go to your command line and type the command 'where flutter', you should see a file path similar to: <br/>
     C:\Users\Hayden Hanson\Developer Tools\flutter\bin <br/>
7. Paste this file path into your 'New' entry, then click OK. <br/>

Flutter is now added to your machines Path! <br/>

Step 3: Run 'flutter doctor' from the command prompt <br/>

*Now that Flutter is added to your Path, you can run flutter commands from your command prompt* <br/>
1. Open command prompt and type 'flutter doctor', if everything up until now was done correctly you should see Flutter working <br> *This tool will tell you what you still need to install to be fully operational*
2. Follow the instructions that flutter doctor provides. <br/>

Step 4: Install Andriod Studio <br/>

*Visit https://docs.flutter.dev/get-started/install/windows and scroll down to 'Andriod Setup' to complete this step* <br/>

Step 5: Set up your Andriod emulator <br/>

*Visit https://docs.flutter.dev/get-started/install/windows and scroll down to 'Set up the Android emulator' to complete this step* <br/>

Step 6: Agree to Andriod Licesnses <br/>

1. Run 'flutter doctor --android-licesnses on the command line <br/>
2. Review each term, pressing 'y' for each one until you are finished <br/>

Step 7 (Yes, you're almost done...): Download Visual Studio 2022 <br/>

Here is the link: https://visualstudio.microsoft.com/downloads/ <br/>
1. Click on 'Community Edition' and the download should begin <br/>
2. Once the download is complete, open the installer and be sure to click the option 'Desktop development with C++' <br/>

Step 8: Set up an editor <br/>

I personally reccomend VS Code... <br/>
But here is the link to get you set up in your favorite IDE: https://docs.flutter.dev/get-started/editor?tab=vscode <br/>

**Now you can begin writing Flutter programs!** <br/>

Windows users can skip to **Setting up the Calculator** <br/>

# Installation Guide for Mac

Step 1: Download Flutter SDK <br/>

*You can download the SDK either directly or from git* <br/>
Here is the link: https://docs.flutter.dev/get-started/install/macos <br/>
Keep track of where you download this SDK, you will need to keep hold of the file path <br/>
*Don't forget to add Flutter to your Macs' PATH, instructions are included in the link above* <br/>

Step 2: Run 'flutter doctor' from the terminal <br/>

*Now that Flutter is added to your Path, you can run flutter commands from your terminal* <br/>
1. Open terminal and type 'flutter doctor', if everything up until now was done correctly you should see Flutter working <br> *This tool will tell you what you still need to install to be fully operational*
2. Follow the instructions that flutter doctor provides. <br/>

Step 3: iOS setup <br/>

1. Install Xcode from the mac app store <br/>
2. Configure the Xcode command-line tools by running the following commands: <br/>
     1. sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer <br/>
     2. sudo xcodebuild -runFirstLaunch <br/>
3. Accept the Xcode license agreements <br/>

Step 4: Set up your iOS simulator <br/>

1. Open terminal and run 'open -a Simulator' <br/>
2. Choose the iPhone you want to preview your Flutter apps on. <br/>

Step 5: Create and run a simple Flutter app <br/>

*We are doing this to initialize some settings with Xcode and the Flutter developement evironment* <br/>

*I could explain how to do this, but the offical website does a very nice job* <br/>
Here is the link: https://docs.flutter.dev/get-started/install/macos **Scroll down to "Create and run a simple Flutter app** <br/>

Step 6: Set up an editor <br/>

I personally reccomend VS Code... <br/>
But here is the link to get you set up in your favorite IDE: https://docs.flutter.dev/get-started/editor?tab=vscode <br/>

**Now you can begin writing Flutter programs!** <br/>

Move on to **Setting up the Calculator** to use our calculator demo<br/> 

# Setting up the Calculator

Step 1: Clone our repo onto your computer <br/>
Step 2: Download and install Java 11 <br/>
Step 3: Set your JAVA_HOME environment variable to Java 11 <br/>
Step 4: Navigate to Flutter-Calculator/CalculatorAppBackend/CalculatorApp and run mvnw spring-boot:run <br/>
Step 5: Open the file with your IDE <br/>
Step 6: Open an emulator, iOS or android <br/>
Step 7: Navigate to the file flutter_calculator in your terminal or command prompt and run flutter run --dart-define="EVAL_REMOTE=false" <br/>

All finished! 😄
