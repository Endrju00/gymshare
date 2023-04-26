# Gymshare

## Tests

To get started testing in a web browser, Download [ChromeDriver](https://chromedriver.chromium.org/downloads).

Launch chromedriver as follows:
```sh
chromedriver --port=4444
```

From the root of the project, run the following command:
```sh
flutter drive --driver=test_driver/integration_test.dart --target=integration_test/app_test.dart -d chrome
```
