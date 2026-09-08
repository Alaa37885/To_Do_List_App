# Implementation Plan - Add, Edit, and Delete TODO Screens

Implement three new screens for the TODO application based on the provided UI designs: Add TODO, Edit TODO (which is shown as Detail in the prompt images but with an Edit button), and Delete TODO.

## Proposed Changes

### Home Feature

#### [NEW] [add_todo_screen.dart](file:///C:/Development/NTI-Sessions/todo_app_NTI_aug_26/lib/features/home/presentation/ui_screens/add_todo_screen.dart)
Create a new screen for adding a TODO. It will be a pink-themed screen (or bottom sheet styled screen) with:
- Title field
- Description field (multi-line)
- Deadline field (optional)
- Image attachment field (optional)
- "ADD TODO" button at the bottom.

#### [NEW] [edit_todo_screen.dart](file:///C:/Development/NTI-Sessions/todo_app_NTI_aug_26/lib/features/home/presentation/ui_screens/edit_todo_screen.dart)
Create a new screen for editing an existing TODO. Similar to the Add screen but pre-filled with TODO data and featuring an "EDIT TODO" button.

#### [NEW] [delete_todo_screen.dart](file:///C:/Development/NTI-Sessions/todo_app_NTI_aug_26/lib/features/home/presentation/ui_screens/delete_todo_screen.dart)
Create a confirmation screen/bottom sheet for deleting a TODO, featuring:
- "Delete TODO" button (red text)
- "Cancel" button (teal/green text)

## Verification Plan

### Manual Verification
- Verify that the Add TODO screen displays correctly when triggered.
- Verify that the Edit TODO screen displays correctly when triggered from the detail screen.
- Verify that the Delete TODO screen displays as a confirmation when the delete icon is pressed.
