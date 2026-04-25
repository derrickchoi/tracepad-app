# Tracepad.ai

Tracepad.ai is a fictional but believable seed-stage company package for an AI workspace that helps field consultants, agencies, and service businesses turn messy field context into polished reports, proposals, follow-ups, and task plans.

Core workflow: capture -> organize -> generate -> review -> deliver.

## Local Run

```bash
npm run artifacts
npm run build
npm run dev
```

Then open `http://localhost:4173`.

Test login:

- Email: `demo@tracepad.ai`
- Password: `tracepad-demo`

## Native Run

macOS:

```bash
./script/build_and_run.sh --verify
```

iOS:

`apps/ios` currently contains a SwiftUI package/view surface that builds with SwiftPM. It is not yet an installable simulator app because there is no Xcode app target or scheme.

## Project Shape

- `apps/web`: merged marketing site, login, and product workspace
- `apps/ios`: SwiftUI iOS capture prototype source
- `apps/macos`: SwiftUI macOS review-studio prototype source
- `docs`: company, product, GTM, security, operations, and investor materials
- `financials`: editable financial model workbook
- `deck`: editable investor deck
- `brand`: generated/local brand assets and product imagery
- `figma`: design artifact fallback package
- `video`: Remotion-style pitch video source and render fallback
- `qa`: verification report and evidence notes
- `implementation-log.md`: execution ledger, capability matrix, blockers, and checklist
- `artifact-index.md`: inventory of local and external artifacts

## Canonical Company Facts

- Stage: pre-seed to early seed
- Team: 1 full-time founder, 2-3 part-time contractors
- Traction: 3 pilot accounts, 9 paying teams, 42 active seats, about $3.2k MRR
- Fundraise: about $1.5M seed
- ICP: high-context service businesses with messy but repeatable deliverables
- Pricing: Solo $69/mo, Team $249/mo, Business $599+/mo
