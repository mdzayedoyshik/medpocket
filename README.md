# Med Pocket

A personal health record app for Android and iOS, built as my final-year project at Northern University Bangladesh in a team of two. It keeps vitals, current medicines and test reports in one place. Its main feature is reading a printed prescription with the phone camera, so medicines do not have to be typed in.

This repository is the Flutter app. The API (Express, MongoDB, file storage on S3) is a separate service.

<!-- screenshots -->

## What it does

- **Vitals:** height, weight, BMI, blood pressure and glucose, with charts over time.
- **Medicines:** a daily list split into morning, noon and night, with a date range for each course.
- **Prescription scan:** the camera finds and crops the page, Google ML Kit reads the text on the device, and a parser turns it into medicine entries the user can check and save.
- **Reports:** lab reports and scans kept in folders, uploaded to the backend.
- Email sign-up and login, password reset and a first-run profile setup.

## How the scan works

```
camera ─► cunning_document_scanner (edge detection, crop)
       ─► google_mlkit_text_recognition (on-device, Latin script)
       ─► regex parser ─► editable list of medicines ─► API
```

Bangladeshi prescriptions mostly follow the same pattern. Each line starts with the dosage form (`TAB`, `CAP`, `INJ`, `SYRUP`, `DROP`, `SPRAY`) and the brand name, and the dosage is written as `1+0+1` (morning + noon + night). The parser looks for those two patterns and pairs them in order. Nothing is saved without the user's say: the result opens as a form where every field can be edited.

The parser lives in `lib/views/medicine/segments/add_medicine_screen.dart`.

## Code layout

```
lib/
├── blocs/           one BLoC per feature (auth, dashboard, measurements, medicine, reports, ...)
├── repositories/    GET / POST / PUT / PATCH wrappers, multipart for photo and report uploads
├── models/          API models
├── views/           screens, with sub-widgets in segments/
├── widgets/         shared inputs, buttons, dialogs
├── configs/         routes, theme, sizes, API URLs
└── database/        cached session, profile and dashboard data (shared_preferences)
```

## Stack

Flutter · flutter_bloc · http · Google ML Kit text recognition · cunning_document_scanner · fl_chart · shared_preferences · image_picker

## Running it

```bash
flutter pub get
flutter run
```

The app points at the hosted API in `lib/configs/app_urls.dart`.

## Known limitations

- Medicines and dosages are paired by order of appearance. A prescription that lists the dosages in a separate column can pair them wrongly, which is why the result is always shown for review before saving.
- Handwritten prescriptions are not supported. ML Kit's Latin model is reliable on printed text only.
- There are no automated tests yet beyond the default widget test.
