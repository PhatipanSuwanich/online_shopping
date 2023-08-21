# My Shopping App

Welcome to **My Shopping App**! This app allows you to explore products, save your favorites, manage your shopping cart, and proceed to checkout. Here's an overview of the app's main features:

## Features

### Home Page

- Display a list of product items in 2 columns.
- Each product card shows the product image, name, and price.
- Save or unsave items using the heart icon on the top right of the card.
- Popup message for saved or unsaved items.
- Click on a product card to view its details.

### Saved Page

- Display saved items in 2 columns.
- Product card displays image, name, and price.
- Unsave items using the heart icon on the top right of the card.
- Popup message for unsaved items.
- Click on a product card to view its details.

### Product Page

- Display product image, name, price, and saved status.
- Toggle save status using the heart icon at the bottom right of the image.
- Add items to the shopping cart.
- Popup message for saved, unsaved, or added items.
- Navigate back using the back button.

### Cart Page

- Display shopping cart items.
- Each card shows image, name, price, and quantity.
- Increase or decrease quantity using plus and minus buttons.
- Swipe to remove items and click on remove button.
- Total price displayed at the bottom left.
- Proceed to checkout using the `Checkout` button.

### Checkout Page (Optional)

- Display a QR code for payment.
- QR code URL: `https://payment.spw.challenge/checkout?price=${total_price}`
- Display total price at the middle bottom.
- Navigate back using the back button.

## Getting Started

1. Clone the repository.
2. Use Flutter version 3.7.0
3. Run `flutter pub get` to install dependencies.
4. Run the app using `flutter run`.

## Dependencies

- [GetX](https://pub.dev/packages/get)
- [qr_flutter](https://pub.dev/packages/qr_flutter)
- [cached_network_image](https://pub.dev/packages/cached_network_image)
- [font_awesome_flutter](https://pub.dev/packages/font_awesome_flutter)
- [intl](https://pub.dev/packages/intl)
- [flutter_slidable](https://pub.dev/packages/flutter_slidable)

## Authors

- Patiphan Suwanich
