# Tracepad.ai QA Report

Run date: 2026-04-25  
Workspace: `/Users/derrickchoi/Code/tracepad-app`

## Summary

Tracepad.ai has a complete local company package with a deployed web app, live Linear backlog, live Figma capture, mirrored Google Sheets/Slides artifacts, local rich documents, local workbook/deck/video/brand assets, and SwiftUI native prototype source.

## Verification Results

| Area | Result | Evidence |
| --- | --- | --- |
| Local artifact generation | passed | `npm run artifacts` generated 23 DOCX files, workbook, deck, and brand assets |
| Web build | passed | `npm run build` built to `apps/web/dist` |
| Artifact verification | passed | `npm run verify` passed required file, workbook sheet/formula token, and PPTX slide-count checks |
| Local browser verification | passed | `http://localhost:4173` loaded; login dialog opened; demo credentials accepted; workspace mode switch and regenerate action updated UI state; mobile viewport rendered |
| Deployed browser verification | passed | `https://tracepad-app.vercel.app` loaded; hero visible; demo login and regenerate interaction passed |
| DOCX visual QA | passed after repair | PRD rendered with artifact-tool to `/tmp/tracepad-docx-render`; initial table layout defect was fixed, then page rendered cleanly |
| Financial workbook | passed | Local `.xlsx` exists with required tabs and no scanned formula error tokens; imported to Google Sheets |
| Pitch deck | passed | Local `.pptx` has 12 slides and imported to Google Slides |
| Imagegen | passed partially | Live API generated `output/imagegen/tracepad-imagegen-logo.png`; broader asset set uses local generated fallback assets |
| Figma | passed | Live Figma capture created: https://www.figma.com/design/xzxjzgZ2HTaqvyXBm4etuZ |
| macOS native build | passed | `swift build` in `apps/macos` completed successfully outside sandbox |
| iOS native build | passed | `swift build` in `apps/ios` completed successfully outside sandbox after adding macOS host platform for package compilation |
| Vercel deploy | passed with note | Deployment ready and aliased to https://tracepad-app.vercel.app; Vercel-GitHub repo connection failed |
| Gmail outreach | passed as draft | Created unsent Gmail draft `r4184564242814212959` |
| Calendar | gated | Calendar profile verified for `derrickchoi@gmail.com`; no invite sent because meeting details and explicit send permission are missing |
| Remotion video | soft blocked | Remotion-style source exists; true Remotion CLI render unavailable because runtime package is absent. MP4 fallback rendered at `output/video/tracepad-pitch.mp4` |
| Google Drive full package | hard blocked | Exposed Drive tools support Sheets import, Slides import, and Google Doc creation, but not folder creation or generic DOCX/image/video upload. Local `output/drive-mirror` mirrors the requested folder structure |

## Live Links

- Vercel production: https://tracepad-app.vercel.app
- Linear project: https://linear.app/derrickchoi/project/tracepadai-company-build-1c15d8cd998f
- Figma capture: https://www.figma.com/design/xzxjzgZ2HTaqvyXBm4etuZ
- Google Sheets financial model: https://docs.google.com/spreadsheets/d/1WnqD9bBb-Hk-kHkfu_p93PtDpCBIY40Ze8tT49yqDXI
- Google Slides pitch deck: https://docs.google.com/presentation/d/12NlIfptyatwQlV8zdv6-Vzg6wHDKnvHMe2ND6X_gZtQ
- Google Doc handoff: https://docs.google.com/document/d/1Sos-HlCJcC9KZuz1hqV_N0SIBSxTWfX4xVEIY2kASEA

## Blockers And Limitations

- Google Drive: full foldered external mirror is blocked by missing exposed folder creation and generic upload tools. The local mirror structure exists in `output/drive-mirror`.
- Vercel: deployment succeeded, but automatic GitHub repository connection failed with an access/repository-linking error.
- Calendar: no event was sent because date, time, timezone, attendee confirmation, and explicit send permission were not available.
- Remotion: true Remotion render is blocked by missing runtime package. A source file and MP4 fallback render exist.
- Native UI launch: macOS/iOS source builds passed, but no simulator or app UI launch was completed in this run.

## Commands Run

- `npm run artifacts`
- `npm run build`
- `npm run verify`
- `swift build` in `apps/macos`
- `swift build` in `apps/ios`
- `npx vercel deploy --yes`
- Imagegen CLI generate for `output/imagegen/tracepad-imagegen-logo.png`
- DOCX render via Documents skill `render_docx.py`

