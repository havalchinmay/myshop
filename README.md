# MyShop App

MyShop is a Flutter-based e-commerce app that allows users to sign in, view products, add items to their cart, list products for sale, and manage orders. The app uses Firebase as the backend for authentication and data storage.

## Features

- **User Authentication:**
  - Sign up and sign in using email and password.
  - Secure authentication with Firebase Authentication.

- **Product Listing:**
  - View a list of available products on the home screen.
  - Product details include name, price, description, and an image.

- **Cart Functionality:**
  - Add products to the cart.
  - View the items in the cart.
  - Adjust quantities or remove items from the cart.

- **Selling Products:**
  - List your own products for sale.
  - Set product details such as name, price, and description.

- **Order Management:**
  - View orders placed by users.
  - Mark orders as shipped or completed.

## Getting Started

1. Clone this repository to your local machine.
2. Set up your Firebase project and configure the necessary credentials (Firebase Authentication and Firestore).
3. Update the `lib/config/firebase_config.dart` file with your Firebase configuration.
4. Run the app using `flutter run`.

## Dependencies

- `firebase_core`: Firebase initialization.
- `firebase_auth`: Firebase authentication.
- `cloud_firestore`: Firestore database.
- `provider`: State management.
