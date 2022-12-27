# Medrecord

Medrecord is a mobile application built with [Flutter](https://flutter.dev/) and [Firebase](https://firebase.google.com/) that allows healthcare providers to securely store and manage electronic medical records (EMR) for their patients.

## Features

- User authentication and authorization: Users (i.e. healthcare providers) can create an account and log in to access their patients' medical records.
- Record creation and management: Users can create new records and add or edit information such as diagnoses, medications, and test results.
- Data security: The application uses encrypted storage and secure communication protocols provided by Firebase to protect patient data.
- Access control: Users can specify which other users (e.g. colleagues or family members) are allowed to view or edit a particular record.

## Installation

Before you can run the Medrecord application, you will need to install the following dependencies:

- [Flutter](https://flutter.dev/docs/get-started/install)
- [Firebase](https://firebase.google.com/docs/flutter/setup)

Once you have these dependencies installed, follow these steps to install and run the Medrecord application:

1. Clone the repository:
```git clone https://github.com/your-username/medrecord.git```
2. Install the project dependencies:
```flutter pub get```
3. Connect your Firebase project to the Medrecord app:
- Follow the instructions in the [Firebase documentation](https://firebase.google.com/docs/flutter/setup) to set up a new Firebase project or use an existing one.
- Replace the `google-services.json` file in the `android/app` directory with the one provided by Firebase.
4. Run the Medrecord app:
```flutter run```
The Medrecord application should now be running on your local machine.

## Usage

To log in to the Medrecord application, you will need to sign up for an account. Click the "Sign Up" button on the login page and follow the prompts to create a new account.

Once you are logged in, you can create new patient records by clicking the "New Record" button on the dashboard. You can also view and edit existing records by clicking on them in the list on the dashboard.

## Contributing 

If you are interested in contributing to the Medrecord project, we welcome your suggestions and pull requests! Please follow these guidelines when submitting contributions:

- Check the [issue tracker](https://github.com/your-username/medrecord/issues) to see if your idea has already been discussed.
- If you are reporting a bug, please include as much detail as possible (e.g. steps to reproduce, error messages, etc.).
- If you are suggesting a new feature, please include a clear and concise description of the idea, as well as any relevant use cases or examples.
