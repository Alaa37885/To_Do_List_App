# Implementation Plan - Fix Project Errors and Typos

The project currently has a significant compilation error due to a missing dependency and several typos in filenames and class names that could lead to confusion and warnings.

## User Review Required

> [!IMPORTANT]
> The most critical error is the missing `firebase_core` dependency in `pubspec.yaml`. This causes `lib/firebase_options.dart` to fail compilation. I will add this dependency.

> [!NOTE]
> I will also fix several typos (e.g., `spalsh_screeen` -> `splash_screen`) to improve code maintainability and resolve a lint warning in the splash screen logic.

## Proposed Changes

### Dependencies

#### [MODIFY] [pubspec.yaml](file:///C:/Development/NTI-Sessions/todo_app_NTI_aug_26/pubspec.yaml)
- Add `firebase_core: ^3.4.0` (or latest stable) to the dependencies section.

---

### Authentication Feature

#### [RENAME] [spalsh_screeen.dart](file:///C:/Development/NTI-Sessions/todo_app_NTI_aug_26/lib/spalsh_screeen.dart) to [splash_screen.dart](file:///C:/Development/NTI-Sessions/todo_app_NTI_aug_26/lib/splash_screen.dart)
- Rename the file and the class `SpalshScreeen` to `SplashScreen`.
- Fix the "async gap" warning by checking `mounted` before using `context`.

#### [MODIFY] [signin_screen.dart](file:///C:/Development/NTI-Sessions/todo_app_NTI_aug_26/lib/features/authentication/presentation/ui_screens/signin_screen.dart)
- Rename class `SingInScreen` to `SignInScreen`.
- Fix typo `passowrd` to `password` in `TextFormFieldWidget` label.

#### [MODIFY] [signup_screen.dart](file:///C:/Development/NTI-Sessions/todo_app_NTI_aug_26/lib/features/authentication/presentation/ui_screens/signup_screen.dart)
- Update imports and class references to match renamed files/classes.

#### [MODIFY] [change_password_screeen.dart](file:///C:/Development/NTI-Sessions/todo_app_NTI_aug_26/lib/features/authentication/presentation/ui_screens/change_password_screeen.dart)
- Rename class `ChangePasswordScreeen` to `ChangePasswordScreen` (and file if desired, but I'll focus on the class first).

---

### Core and Main

#### [MODIFY] [main.dart](file:///C:/Development/NTI-Sessions/todo_app_NTI_aug_26/lib/main.dart)
- Update imports for the renamed splash screen.
- Properly initialize Firebase using `DefaultFirebaseOptions` from `firebase_options.dart`.

## Verification Plan

### Manual Verification
- I will run `analyze_file` on all modified files to ensure no new errors are introduced.
- I will verify that `firebase_options.dart` no longer shows errors after adding the dependency.
