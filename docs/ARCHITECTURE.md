# Application Architecture

This document defines the target architecture for the disaster management application.
It is intentionally compatible with the current implementation: existing imports,
routes, providers, and runtime behavior remain unchanged until a feature is migrated
completely.

## Repository boundaries

```text
/
├── frontend/                  Flutter client
│   ├── lib/
│   ├── assets/
│   ├── test/
│   └── platform runners
├── backend/                   Node.js API and services
├── docs/                      Architecture and operational documentation
└── scripts/generators/        Development-only generators
```

## Flutter target structure

```text
frontend/lib/
├── app/
│   ├── app.dart               Root MaterialApp.router widget
│   ├── bootstrap.dart         Firebase, Hive, and other startup work
│   └── router.dart             Route composition
│
├── core/
│   ├── config/                Environment and app configuration
│   ├── errors/                Shared failure and exception types
│   ├── networking/            Dio client, interceptors, and API results
│   ├── storage/               Hive boxes and local storage helpers
│   ├── theme/                 App themes and design tokens
│   ├── utils/                 Small framework-independent utilities
│   └── widgets/               Reusable widgets with no feature behavior
│
├── features/
│   ├── auth/
│   ├── home/
│   ├── sos/
│   ├── reports/
│   ├── shelters/
│   ├── maps/
│   ├── weather/
│   ├── alerts/
│   ├── chat/
│   ├── volunteers/
│   ├── profile/
│   ├── emergency_contacts/
│   └── offline/
│
└── shared/
    └── widgets/               Temporary compatibility location
```

Each migrated feature should use this shape:

```text
features/<feature>/
├── data/
│   ├── datasources/            HTTP, Firebase, device, or local sources
│   ├── models/                 JSON and persistence models
│   └── repositories/           Repository implementations
├── domain/
│   ├── entities/               Business objects
│   ├── repositories/           Repository interfaces
│   └── usecases/               Feature actions and business rules
└── presentation/
    ├── providers/              Riverpod state and dependency providers
    ├── screens/                Pages registered with the router
    └── widgets/                Feature-specific UI components
```

## Dependency direction

```text
presentation -> domain <- data
core         -> all layers
features     -> core and their own feature code
feature A    -X-> feature B internals
```

- Screens and providers may call domain use cases.
- Domain code must not import Flutter widgets, Dio, Firebase, or Hive.
- Data implementations satisfy domain repository interfaces.
- Features must not import another feature's `data` or `presentation` internals.
- Shared widgets must not contain feature-specific business rules.

## Current compatibility rules

These rules prevent the architecture work from changing app behavior:

1. Keep `lib/core/routes/app_router.dart` as the route authority until all routes
   have been migrated to `lib/app/router.dart`.
2. Keep `lib/core/providers/repository_providers.dart` as the dependency wiring
   authority until each feature owns its providers.
3. Do not rename or move a file without updating every import in the same change.
4. Do not change route paths, repository interfaces, provider names, or model JSON
   keys during a structural migration.
5. Migrate one feature at a time and run `flutter analyze` and its focused tests
   before starting the next feature.
6. Keep compatibility exports temporarily when an old import path is used outside
   the migrated feature.
7. Delete old files only after a repository-wide reference search finds no imports.

## Migration status

The first feature slice is implemented without changing route URLs or removing
legacy symbols:

- `settings` now owns its screen, provider, model barrel, domain repository
   boundary, and API repository adapter.
- `profile` now owns its provider, model barrel, domain repository boundary, and
   API repository adapter.
- `emergency_contacts` now owns its screen, provider, model barrel, domain
   repository boundary, and API repository adapter.
- The old settings and emergency-contact screen paths remain compatibility
   exports for callers that still use them.
- The router now imports the feature-owned settings and emergency-contact screens
   directly.

The global repository registry and legacy viewmodels remain in place until all
features have been migrated and verified.

The compatibility migration now also includes:

- `lib/app/` for startup, root app composition, and router exports.
- Feature provider facades for the remaining legacy viewmodels, so active screens
   no longer need to import `lib/viewmodels/` directly.
- Canonical feature screen exports for relief centers and volunteers.
- `backend/src/modules/` route, controller, and service facades for every current
   API domain.
- `backend/src/app.js` registering module route facades while preserving all
   existing endpoint paths.

Legacy implementation files are intentionally retained as compatibility
adapters. They can be deleted only after the underlying implementations have
been physically moved and repository-wide import checks pass.

## Safe migration order

### Phase 1: foundations

Create `app/`, `core/errors/`, `core/networking/`, and `core/storage/` without
moving existing files. Add adapters around the existing implementations first.

### Phase 2: low-risk features

Migrate `settings`, `profile`, and `emergency_contacts`. These features have lower
cross-feature coupling and establish the data/domain/presentation pattern.

### Phase 3: operational features

Migrate `weather`, `alerts`, `shelters`, `reports`, and `maps` one at a time.

### Phase 4: high-risk features

Migrate `auth`, `sos`, `offline_communication`, and
`offline_walkie_talkie` last. These use routing, permissions, device services, or
session state and need dedicated integration tests.

### Phase 5: cleanup

Merge duplicate feature names, remove compatibility exports, and move the route
composition and startup code into `app/` only after behavior is verified.

## Backend target structure

The backend should gradually move from shared `controllers/`, `routes/`, and
`services/` folders to module-owned boundaries:

```text
backend/src/
├── app.js
├── server.js
├── config/
├── database/
├── middleware/
├── shared/
│   ├── errors/
│   ├── logger/
│   └── utils/
└── modules/
    ├── auth/
    ├── users/
    ├── sos/
    ├── reports/
    ├── shelters/
    ├── maps/
    ├── weather/
    ├── notifications/
    └── ai/
```

Each backend module may contain its route, controller, service, validation, and
mapper. `app.js` should remain responsible only for middleware and module route
registration.

Backend modules should be migrated after the Flutter API contracts are stable so
that endpoint paths and response shapes do not change during structural work.
