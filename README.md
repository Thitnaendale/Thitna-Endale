# M-Pesa Sign-In (Flutter)

A Flutter recreation of the M-Pesa PIN sign-in screen, integrated with the provided mock login API.

## Architecture

The app uses a lightweight **layered architecture** (data → state → UI), a scaled-down version of MVVM appropriate for a small, single-flow app under time pressure:

**Why this structure:** it keeps the API layer, state management, and UI completely decoupled. `AuthService` doesn't know Flutter exists; `AuthProvider` doesn't know how the PIN pad is drawn; screens never call `http` directly. This makes each piece independently testable and easy to extend later (e.g. swapping Provider for Riverpod/Bloc only touches the `providers/` folder).

## Packages used and why

| Package    | Reason |
|------------|--------|
| `provider` | Minimal boilerplate state management, well suited to a small, well-defined state machine (idle/loading/success/error). |
| `http`     | Standard, lightweight package for a single REST call — no need for Dio's interceptors/retries here. |
| `iconsax`  | Required by the exam brief for iconography (used for the fingerprint and backspace icons on the keypad). |

## Key technical decisions

- **PIN-only flow**: the provided API only accepts a `pin` in the request body (no phone number), so the UI is a pure 4-digit PIN pad rather than a phone+PIN form.
- **State machine via enum** (`AuthStatus.idle/loading/success/error`): makes the UI a pure function of state — no scattered booleans to keep in sync.
- **Auto-submit on 4th digit**: mirrors real M-Pesa/mobile-money UX — no separate "Login" button needed.
- **Error handling**: network failures, malformed JSON, and API-level errors (`success: false`, e.g. `404 USER_NOT_FOUND`) are all caught and normalized into a single `errorMessage` shown under the PIN dots, and the PIN is cleared so the user can retry immediately.
- **No secure token storage**: out of scope for a 3-hour UI/API exercise; in a production app the returned `token` would go into `flutter_secure_storage`.

## AI tools used and how

Claude (Anthropic) was used to scaffold the project structure, generate the `AuthService`/`AuthProvider` boilerplate, and produce the initial UI layout for the PIN screen based on the API spec, given time constraints. Code was reviewed and adapted afterward — in particular the error-handling paths in `AuthService` and the state transitions in `AuthProvider` were checked against the spec's success/error JSON shapes.

## How to run

1. Clone the repo.
2. Install dependencies:
3.  Run on Chrome:
4.  Test PIN `1111` for a successful login; any other PIN returns the mock "User not found" error.
