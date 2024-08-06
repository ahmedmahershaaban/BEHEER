# BEHEER

**BEHEER** is a sophisticated Flutter application designed to deliver a seamless and intuitive user experience across multiple platforms. With a strong focus on pixel-perfect design, clean code architecture, and efficient use of modern technologies, this project exemplifies the application of Domain Driven Design (DDD) and Agile methodologies to deliver a high-quality product within a short time frame.

## Table of Contents

- [Project Overview](#project-overview)
- [Screenshots & Videos](#screenshots--videos)
- [Key Features](#key-features)
- [Architecture](#architecture)
- [Technology Stack](#technology-stack)
- [Packages Used](#packages-used)
- [CI/CD Integration](#cicd-integration)
- [Installation & Setup](#installation--setup)
- [Contact](#contact)

## Project Overview

The **BEHEER** application was developed in just 3 days, showcasing a rapid yet thorough approach to building a feature-rich, cross-platform app. The application is designed to operate efficiently across three distinct environments: Production, Development, and Testing. It leverages the power of Flutter for front-end development and Firebase for back-end services, ensuring a robust and scalable solution.

## Screenshots & Videos

<table>
  <tr>
    <td><b>Registration Page Light Mode</b></td>
    <td><b>Home Page Light Mode</b></td>
    <td><b>Project Summary Page Light Mode</b></td>
    <td><b>Calendar Schedule Page Light Mode</b></td>
  </tr>
  <tr>
    <td><img src="https://github.com/user-attachments/assets/46d03da7-ab1f-46fb-a062-5430928237a4" width="270" height="480" alt="Registration Page Light Mode"></td>
    <td><img src="https://github.com/user-attachments/assets/45d18a6e-fc9f-4e88-a51d-a86bdc62c312" width="270" height="480" alt="Home Page Light Mode"></td>
    <td><img src="https://github.com/user-attachments/assets/dd1ac778-1bd5-4999-ba97-a4c9cb7d308e" width="270" height="480" alt="Project Summary Page Light Mode"></td>
    <td><img src="https://github.com/user-attachments/assets/0ca7e8d7-5fbb-4e34-b851-1a606672f27a" width="270" height="480" alt="Calendar Schedule Page Light Mode"></td>
  </tr>
  <tr>
    <td><b>Calendar Task Page Light Mode</b></td>
    <td><b>Profile Page Light Mode</b></td>
    <td><b>Menu Light Mode</b></td>
     <td><b></b></td>
 </tr>
  <tr>
    <td><img src="https://github.com/user-attachments/assets/55768895-01fb-45f4-b875-0044ed60cb01" width="270" height="480" alt="Calendar Task Page Light Mode"></td>
    <td><img src="https://github.com/user-attachments/assets/b4245dac-f929-43f6-9151-a01be594d45e" width="270" height="480" alt="Profile Page Light Mode"></td>
    <td><img src="https://github.com/user-attachments/assets/45aba352-65df-4673-a800-9f7d2b8215db" width="270" height="480" alt="Menu Light Mode"></td>
    <td></td>
  </tr>
  <tr>
     <td><b>Registration Page Dark Mode</b></td>
     <td><b>Home Page Dark Mode</b></td>
    <td><b>Project Summary Page Dark Mode</b></td>
    <td><b>Calendar Schedule Page Dark Mode</b></td>
  </tr>
  <tr>
     <td><img src="https://github.com/user-attachments/assets/dd895b93-8f56-4009-b4d9-d57f8670a145" width="270" height="480" alt="Registration Page Dark Mode"></td>
     <td><img src="https://github.com/user-attachments/assets/95666186-57b8-45fa-8942-16b088df18ce" width="270" height="480" alt="Home Page Dark Mode"></td>
    <td><img src="https://github.com/user-attachments/assets/abaddc3b-a9e0-4125-b6d7-b877809ddf2f" width="270" height="480" alt="Project Summary Page Dark Mode"></td>
    <td><img src="https://github.com/user-attachments/assets/7ec1ee30-8754-442e-9fd1-66d464fec2bd" width="270" height="480" alt="Calendar Schedule Page Dark Mode"></td>
  </tr>
  <tr>
     <td><b>Calendar Task Page Dark Mode</b></td>
     <td><b>Profile Page Dark Mode</b></td>
    <td><b>Menu Dark Mode</b></td>
    <td><b></b></td>
  </tr>
  <tr>
      <td><img src="https://github.com/user-attachments/assets/c7b4bd3f-87c3-4b47-b937-4139c2729956" width="270" height="480" alt="Calendar Task Page Dark Mode"></td>
      <td><img src="https://github.com/user-attachments/assets/41e3ed76-9005-4a2a-bff1-75d28095d27f" width="270" height="480" alt="Profile Page Dark Mode"></td>
    <td><img src="https://github.com/user-attachments/assets/9f578007-bc70-4e0e-afc0-38bf77c87c19" width="270" height="480" alt="Menu Dark Mode"></td>
    <td></td>
  </tr>
</table>


### Key Aspects

- **Rapid Development**: Completed within 3 days, demonstrating effective use of development time and resources.
- **Multi-Environment Support**: Configured for Production, Development, and Testing environments, each with tailored settings and configurations.

## Key Features

- **Pixel-Perfect Design**: The app adheres to a pixel-perfect design philosophy, ensuring that the user interface is consistently aligned with the Figma designs across various devices and screen sizes.
- **Dark Mode Implementation**: Leveraged skills in **Figma** to replicate the project's design and implement a fully functional dark mode. The dark mode is seamlessly integrated into the application, providing users with a comfortable viewing experience in low-light conditions.
- **CI/CD Integration**: Utilized **GitHub Actions** and **CodeMagic** for Continuous Integration and Continuous Deployment. This integration automates the build, test, and deployment processes, facilitating smooth updates to the app.
- **Store Uploading**: The application has been deployed to both the **Google Play Store** and **Apple App Store**. Automated updates are handled through CI/CD pipelines, with the APK files available in the GitHub release section under tag `v1.0.0`.
- **Store Environment Management**: Each environment (Production, Development, Testing) has its own configuration, allowing for specific adjustments and testing scenarios.

## Architecture

The architecture of **BEHEER** is designed to be modular and maintainable, following a structured approach with clearly defined layers:

1. **Application Layer**
   - **Auth Flow**: Manages user authentication and authorization. Implements login, registration, and authentication status handling using **Bloc** for state management and **GetIt** for dependency injection.
   - **User Flow**: Handles user-related operations, including profile management, project interactions, and user navigation. Manages the state and lifecycle of user-related features.
   - **Core Functionality**: Provides essential utilities such as internet connectivity checks and theme management.

2. **Domain Layer**
   - **Core Flow**: Contains domain-specific logic including value objects, error handling, and validation rules. Ensures business rules and domain logic are maintained separately from application logic.
   - **OAuth Flow**: Defines authentication models and interfaces. Implements logic for user authentication and integrates with external authentication services.
   - **User Flow**: Includes models and interfaces related to user actions and data management. Defines structures for calendar days, projects, and user tasks.

3. **Infrastructure Layer**
   - **Configuration Reader**: Loads and manages configuration files, ensuring sensitive data is handled securely and not exposed in the repository.
   - **Firebase Helper**: Provides utility extensions for **Firebase Firestore**, making it easier to interact with Firestore collections and documents.
   - **JSON Serializable Helper**: Handles JSON serialization with custom converters, ensuring smooth data exchange between the application and Firebase.
   - **Third-Party Libraries Model**: Manages integrations with third-party libraries such as **Google Sign-In** and connectivity checks. Includes lazy singletons for efficient resource management.

4. **Presentation Layer**
   - **Extensions**: Contains utility extensions for strings and text themes, enhancing UI consistency and readability.
   - **Routes**: Defines and manages application navigation, using the **auto_route** package for efficient route handling.
   - **Themes**: Includes light and dark mode themes, ensuring a visually appealing experience in different lighting conditions.
   - **Components**: Houses shared UI components and widgets used across different parts of the application.

## Technology Stack

- **Frontend**: **Flutter**
- **Backend**: **Firebase** (Firestore, Authentication, Storage, Messaging, Functions)
- **State Management**: **Bloc**, **GetIt**
- **Routing**: **auto_route**
- **Version Management**: **new_version_plus**
- **Dependency Injection**: **GetIt**
- **JSON Serialization**: **json_serializable**
- **Continuous Integration/Continuous Deployment**: **GitHub Actions**, **CodeMagic**

## Packages Used

- **FlutterScreenUtil**: Ensures pixel-perfect design and responsiveness across different screen sizes.
- **auto_route**: Automatically generates and manages application routes for seamless navigation.
- **Bloc**: Implements state management using the Bloc pattern, ensuring a clear separation between business logic and UI.
- **GetIt**: Provides dependency injection for managing singletons and services throughout the application.
- **new_version_plus**: Manages version checks and updates, allowing for background updates and user notifications.
- **json_serializable**: Facilitates JSON serialization and deserialization with custom converters.
- **connectivity_plus**: Checks internet connectivity and provides real-time updates on network status.
- **shared_preferences**: Handles local storage for user preferences and settings.
- **firebase_auth**: Manages user authentication and integrates with Firebase Authentication.
- **firebase_firestore**: Interacts with Firestore for real-time data storage and retrieval.
- **firebase_storage**: Manages file storage and retrieval within Firebase.
- **firebase_messaging**: Handles push notifications and integrates with Firebase Cloud Messaging.

## CI/CD Integration

- **Continuous Integration/Continuous Deployment**: Utilized **GitHub Actions** and **CodeMagic** for automating the build, test, and deployment processes. This integration ensures that code changes are automatically tested and deployed, streamlining the development workflow.
- **Store Uploading**: The application is automatically updated on the **Google Play Store** and **Apple Store** through CI/CD pipelines. This ensures that users have access to the latest features and bug fixes. APK files for the latest release are available in the GitHub release section under tag `v1.0.0`.

## Installation & Setup

1. **Clone the Repository**: Clone this repository to your local machine using the following command:
   ```sh
   git clone https://github.com/ahmedmahershaaban/BEHEER.git

## Contact

**Contact Information**  
Email: [ahmedmaher13579@outlook.com](mailto:ahmedmaher13579@outlook.com)  
Twitter: [@Ahmed__M_Shaba](https://twitter.com/Ahmed__M_Shaba)  
LinkedIn: [Ahmed Maher](https://linkedin.com/in/ahmed-maher0)  
GitHub: [ahmedmahershaaban](https://github.com/ahmedmahershaaban)  
Kaggle: [ahmedmaher00](https://kaggle.com/ahmedmaher00)


You can also view my GitHub language statistics here:  
[![Top Langs](https://github-readme-stats.vercel.app/api/top-langs/?username=ahmedmahershaaban)](https://github.com/anuraghazra/github-readme-stats)
