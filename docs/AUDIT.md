# Store App audit and maintenance

## Architecture

Flutter/Dart presentation app with Material 3, Arabic/RTL localization, a six-product local catalog, Provider/ChangeNotifier cart state, and platform scaffolding for Android, iOS, web, Linux, macOS, and Windows. It has no backend, database, login, payment, checkout, or remote product API. Product assets are synthetic/demo catalog content already included in the repository.

## Issues found and addressed

| Finding | Resolution |
| --- | --- |
| Delete button decreased quantity twice and could leave units behind | Added explicit CartProvider.remove and a one-tap complete line deletion; regression-tested with five units. |
| Cart items could be mutated outside the provider | CartItem.quantity is immutable; list exposure remains unmodifiable; mutations notify through the provider. |
| Badge count was recomputed in the screen | Added a central totalQuantity getter. |
| Product/detail prices used dollars while cart used dirhams | Shared dirham formatting across all three views; original numeric demo prices preserved. |
| Fixed/viewport-wide card dimensions and images broke desktop/narrow layouts | Constrained responsive catalog columns, flexible cards, bounded detail imagery, and wrapping cart controls/summary. |
| Product image rendering duplicated; filenames misspelled | Reused ProductImage; renamed product_cart.dart to product_card.dart and producr_image.dart to product_image.dart. |
| Inert menu icon suggested a feature that did not exist | Removed the nonfunctional decoration; retained the working cart action. |
| Minimal empty-cart feedback and immediate bulk clearing | Added shopping-return action and clear confirmation/cancel. |
| Runtime Google Fonts dependency needed network/font downloads | Bundled the same Almarai family and license locally; removed Google Fonts and its now-unused transitive dependencies. |
| Deprecated ColorScheme.background and constructor lint | Updated to surface and super parameters; analyzer clean. |
| Default Flutter counter test did not match the app | Replaced with real store/cart regression tests. |
| Web title/manifest/README were template placeholders | Added Arabic metadata and professional setup/features/screenshots documentation. |
| Ignore rules lacked some local/signing protection | Added environment, signing key/certificate, local.properties, IDE, and ephemeral-directory exclusions. |

## Preserved behavior and boundaries

Arabic RTL, the existing teal/yellow brand palette, six products/images/descriptions and numeric prices, Provider state management, and in-memory cart behavior are retained. No payment or order backend was invented. No database or user data was added. Refresh still clears the cart; persistence is a separate feature, not silently introduced here.

Android release configuration still contains template application-ID/debug-signing defaults. Private release signing must be configured by the owner before distribution; no keys were created or committed. Platform runners and generated plugin-registration source remain tracked because Flutter platform builds use them. There were no tracked build/cache directories requiring removal in this repository.

## Validation

- Flutter 3.38.9 / Dart 3.10.8 used; manifest minimums now reflect the tested modern SDK family instead of implying support for older incompatible toolchains.
- flutter pub get passed after dependency cleanup.
- flutter analyze: no issues found.
- flutter test: seven tests passed.
- flutter build web --release --no-web-resources-cdn: passed. Standard Wasm capability/font tree-shaking messages are informational.
- Real Chrome/Playwright validation exercised catalog/details, additions, quantity changes, complete deletion of a five-unit line, clear confirmation/cancel, empty state and desktop layout.
- Seven screenshots captured at mobile and desktop viewport sizes from the actual release build, using the bundled demo products. Passwords/customer data do not exist in these flows.
- Almarai and renderer resources are local in the documented web build. Browser inspection also observed Flutter engine fallback fonts from fonts.gstatic.com (Roboto/Noto); this is documented rather than claiming a fully offline app. No external application API or customer-data request was made.

Native Android/iOS/macOS/Windows/Linux builds were not validated. Flutter doctor reports some Android SDK licenses still require acceptance and Windows C++ build components are missing; Apple targets require macOS/Xcode. These local machine prerequisites are documented rather than changed without consent.

## Main changed files

Cart provider/screen, app theme and constants, immutable product model, home/details screens and widgets, renamed reusable product widgets, pubspec/lockfile, web metadata, ignore rules, test files, README, this audit, bundled fonts/license, and docs/screenshots/*.png. No credentials or local machine configuration are committed.
