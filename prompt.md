# Tracepad.ai Full-Stack Company Build

## Goal

Build **Tracepad.ai** from scratch as a fictional but believable seed-stage software company.

Tracepad.ai is an AI workspace for field consultants, small agencies, and service businesses. It turns voice notes, photos, site visits, client conversations, and messy project context into polished reports, proposals, follow-ups, and task plans.

The final output should feel like a real company package, not a scattered collection of generated files.

It should include:
- a believable product
- a cohesive brand
- a polished marketing website
- a usable web app
- a buildable iOS app
- a buildable macOS app
- company docs
- a financial model
- an investor deck
- design artifacts
- a Linear backlog
- QA documentation
- committed source code
- a clear final handoff

Do not stop at planning. Build the artifacts. Do not stop working until absolutely everything required by this prompt is done, verified, indexed, and handed off, unless a true hard blocker prevents completion and has been clearly documented.

---

## Mission

Create a complete and coherent company package for **Tracepad.ai** that could credibly be shown to:
- founders
- operators
- designers
- engineers
- investors
- early hires

The result should be polished enough that someone could:
- inspect it locally
- click through the software
- review the docs and operating materials
- open the deck and financials
- understand the company strategy
- continue building from the repo and internal systems

This should feel like an actual startup foundation in progress.

---

## Decision Authority

You have broad authority to make reasonable decisions in service of the final outcome.

Unless blocked by access, tooling, or an unavoidable dependency, you should decide and execute on your own judgment for:

- product scope and v1 boundaries
- feature prioritization
- UX and information architecture
- brand direction
- visual system and design language
- implementation details
- tech stack details within the preferred stack
- folder structure
- component structure
- data model
- seed data
- pricing structure
- analytics structure
- QA approach
- artifact naming
- artifact organization
- commit structure
- how to use the listed plugins and tools
- how to sequence and parallelize the work

Do not ask clarifying questions unless:
1. a decision would materially change the outcome, and
2. it cannot be resolved through reasonable judgment.

If multiple valid options exist, choose the one most likely to create the most polished, believable, and coherent company package.

You are explicitly authorized to do whatever you think is necessary to create the strongest final result, including producing additional supporting artifacts when they improve believability, usefulness, polish, or handoff quality.

---

## Quality Standard

The finished output must feel coherent across product, company narrative, design, and operations.

This should not feel like:
- a template
- a hackathon demo
- disconnected artifacts made in isolation
- generic AI startup filler
- placeholder-heavy work
- a superficial marketing shell without product substance

This should feel like:
- a real company with a point of view
- a clear product for a specific customer
- a usable software prototype
- a believable seed-stage operating foundation
- a consistent design and messaging system
- a founder-ready set of materials

Optimize for:
- polish
- coherence
- credibility
- usability
- maintainability
- clarity of strategy
- strength of presentation

Prefer real artifacts over descriptions of artifacts.

---

## Coherence Rule

All outputs must describe the same company.

The docs, financial model, investor deck, website, web app, iOS app, macOS app, Figma files, brand assets, Linear backlog, QA report, analytics/observability plan, and GitHub repo must align on:

- company narrative
- product positioning
- target users
- terminology
- workflow
- pricing
- roadmap direction
- design language
- core data concepts
- product maturity
- strategic focus

Avoid:
- mismatched terminology
- conflicting pricing
- inconsistent UI language
- different product stories in different artifacts
- disconnected levels of polish
- random or duplicated seed data
- contradictory feature scope

---

## Operating Rules

- Make reasonable assumptions and keep moving.
- Use best judgment when details are unspecified.
- Do not ask clarifying questions unless blocked.
- Prefer real artifacts over descriptions.
- Prefer implementation over commentary.
- Prefer polished outputs over minimal compliance.
- Prefer durable structure over quick hacks.
- Prefer believable specificity over generic filler.
- Keep a running `implementation-log.md`.
- Record decisions, assumptions, completed work, open work, blockers, and artifact links.
- Use fictional but plausible names, scenarios, metrics, pricing, and numbers.
- Do not impersonate real customers, investors, partners, press, or certifications.
- Keep code maintainable and organized.
- Use comments where they materially help.
- Verify important flows before declaring completion.
- Early in the run, check which connector and tool paths are actually writable versus read-only, then record the resulting capability and fallback plan in `implementation-log.md`.
- Add a capability discovery report near the top of `implementation-log.md` before substantial build work starts.
- The capability discovery report must include a table covering GitHub, Linear, Google Drive, Vercel, Documents, Spreadsheets, Presentations, Browser Use, Computer Use, Figma, Gmail, Google Calendar, Remotion, Imagegen, local filesystem, native build tools, and automation tooling.
- For each capability, record status (`available`, `partially available`, `unavailable`, or `not tested yet`), what was tested, whether it can create/update real artifacts, the fallback path, and whether failure is a hard blocker or soft blocker under this prompt.
- Use `Computer Use` wherever visual confirmation, real UI interaction, or last-mile artifact verification materially improves confidence.
- Use subagents whenever they materially help parallelize independent workstreams.
- Integrate subagent outputs into one coherent company package.
- Prefer delegating bounded artifact workstreams such as spreadsheets, decks, and core docs when that parallelism helps, while keeping final coherence and cross-artifact consistency in the main agent.
- Do not let parallel work produce disconnected artifacts.
- If an extra artifact would make the package stronger, create it.
- Do not describe any artifact as complete, created, uploaded, deployed, or verified unless the live artifact or actual verification result exists.
- Keep a live required-surfaces checklist in `implementation-log.md` and mark each major surface as `not started`, `in progress`, `done`, `soft blocked`, or `hard blocked`.
- Do not treat the run as effectively complete just because the web app is built, deployed, or verified.
- If the user asks for a narrower artifact during the run, complete that request without losing track of the full required package.

Completion persistence rule:

- Do not stop working until every required artifact, app surface, external system, QA pass, artifact index entry, implementation-log entry, and final handoff item is complete.
- Do not send the final handoff while any required checklist item is still `not started` or `in progress`.
- A checklist item may remain incomplete only if it is explicitly marked `soft blocked` or `hard blocked`, the strongest available fallback has been completed, and the blocker is documented in `implementation-log.md`, `qa/qa-report.md`, and the final handoff.
- Before final handoff, perform one last pass over `implementation-log.md`, `artifact-index.md`, `qa/qa-report.md`, local files, and live links to close every remaining gap that is not genuinely blocked.
- If more work is possible, keep working. Treat the final handoff as the last action after all required work is complete, not as a progress update.

## Blocker Policy

Distinguish clearly between hard blockers and soft blockers.

Hard blockers:

* GitHub repository setup, commit workflow, or required source/artifact-index commit cannot be completed
* Linear project or issue workflow cannot be created or updated
* Google Drive upload, foldering, organization, or required external artifact mirror cannot be completed after the local artifact exists
* Vercel deployment cannot be completed when deployment is required
* a required rich-artifact skill is unavailable for a deliverable that explicitly depends on it  
* a required artifact cannot be generated locally as a real file or live surface

Soft blockers:

* full Figma design-file authoring is unavailable but a FigJam round trip is still possible  
* iOS simulator launch is unavailable while the project still builds successfully  
* optional polish or external-system enrichments cannot be completed without blocking the rest of the package

Rules:

* Hard blockers must be called out immediately in the implementation log and final handoff.  
* Soft blockers must still be reported, but they should not stop the rest of the package from being completed.  
* Do not hide hard blockers behind fallback artifacts.

---

## Repository Default

Use the existing repository at `/Users/derrickchoi/tracepad-app` as the canonical workspace unless there is a compelling reason not to.

Build the company package inside that repository as one coherent root project.

Do not create disconnected local projects with inconsistent structure or naming.

Default repo shape rule:

- Keep the company in one git repo by default.
- Do not split the marketing site, web app, iOS app, and macOS app into separate repos unless there is a compelling operational reason.
- Separate surfaces inside the repo with clear app directories or native project boundaries instead of separate repositories.

Mandatory skill rule for rich artifacts:

- When a requested deliverable maps to a dedicated rich-artifact skill, the agent must use that skill rather than an ad hoc fallback.
- This applies at minimum to:
  - `build-web-apps:frontend-app-builder` for the marketing website, web app, frontend product surfaces, dashboards, hero sections, and other visually important UI work
  - [@documents](plugin://documents@openai-primary-runtime) for very rich, beautifully formatted company docs, operating docs, memos, guides, and handoff documents
  - [@spreadsheets](plugin://spreadsheets@openai-primary-runtime) for spreadsheet work, including the financial model, analytical workbooks, charts, formulas, and `.xlsx` deliverables
  - [@presentations](plugin://presentations@openai-primary-runtime) for creating the startup pitch deck as a beautiful, rich, detailed, editable presentation
  - `Imagegen` for the startup logo, generated brand assets, website images, app imagery, product mockups, marketing images, and visual assets embedded in rich artifacts such as documents, spreadsheets, and presentations
- Do not silently substitute a lighter local script, plain markdown, weakly formatted file, or placeholder export when one of these richer artifact paths is required.
- If a required rich-artifact skill is unavailable, blocked, misconfigured, or cannot complete the requested deliverable, report that explicitly as a blocker in the implementation log, QA report, and final handoff instead of claiming completion.

Important storage rule:

- Use the repo as the implementation workspace for code, scripts, generated source files, tracking files, and reproducible build inputs.
- For company-facing deliverables, first generate the real artifact locally inside the repo in an organized, openable form.
- The required workflow for documents, spreadsheets, presentations, brand assets, videos, and other business artifacts is local first, artifact surfacing second, Google Drive externalization third.
- Create the canonical local file first, using native editable formats when applicable, such as `.docx` for rich documents, `.xlsx` for spreadsheets and financial models, and `.pptx` for presentations and pitch decks.
- Link the local file with an absolute path in `artifact-index.md` and the final handoff so it can be opened directly and surfaced in the Codex app artifact UI / sidepanel when supported.
- After the local artifact exists and has been checked, upload or recreate it in Google Drive using the organized Drive folder structure as the external handoff copy.
- This includes the company one-pager, product requirements doc, go-to-market plan, brand guide, customer discovery brief, launch checklist, security/privacy overview, execution plan, data room index, roadmap, pitch deck, company financial projections, spreadsheets, and other final handoff materials.
- If a polished local artifact is created first as part of the build process, keep that local file as a first-class deliverable rather than treating it as disposable intermediate output.
- If Google Drive is unavailable, incomplete, or missing the needed artifact operations, keep the local artifact package complete and report the Google Drive failure as a hard blocker.
- For spreadsheet and presentation deliverables, preserve the canonical editable local source file in its native format.
- The financial model must remain available locally as `.xlsx`.
- The pitch deck must remain available locally as `.pptx`.
- Do not downgrade these artifacts to markdown-only, PDF-only, screenshot-only, or hosted-only substitutes and then claim the native artifact exists.
- Spreadsheet and deck artifacts should be created as standalone local files with stable, obvious paths rather than existing only as intermediate generation outputs, hidden temp files, or cloud-only mirrors.

Artifact surfacing rule:

- Every meaningful deliverable must exist as a real local file or runnable surface, not just as described text.
- Every meaningful deliverable must be recorded in `artifact-index.md` with at least:
  - artifact name
  - type
  - local path
  - external URL when available
  - owning system
  - status
  - notes
- In the final handoff, explicitly link the key local files with absolute repo paths so they can be opened directly and surfaced in the Codex app artifact UI / sidepanel when supported.
- For local business artifacts, prefer native editable files over screenshots or PDFs. Do not create PDF exports unless explicitly requested.
- When the deliverable is a spreadsheet or deck, link the native local `.xlsx` or `.pptx` file directly rather than linking only a mirrored Google Sheets or Google Slides URL.
- For spreadsheets and decks, prefer dedicated, human-readable output locations such as `output/spreadsheet/` and `output/presentations/` or another equally obvious repo path, and keep filenames stable and descriptive.
- Prefer file formats that are easy to open and inspect locally, such as `.md`, `.docx`, `.xlsx`, `.pptx`, `.png`, `.mp4`, and buildable app/code directories.

Google Drive organization rule:

- Do not upload all artifacts into one flat Drive location.
- Create one top-level Google Drive folder for the company package, for example `Tracepad.ai`.
- Organize uploaded artifacts into clear subfolders so a reviewer can browse the package quickly.
- Prefer this default Drive structure unless there is a strong reason to adapt it:
  - `01 Company Docs`
  - `02 Product and PRD`
  - `03 Financial Model`
  - `04 Pitch Deck`
  - `05 Brand Assets`
  - `06 Design Artifacts`
  - `07 QA and Handoff`
  - `08 Video`
- Group related docs together inside the appropriate subfolder instead of scattering them across Drive.
- Put the PRD, roadmap, onboarding guide, and related product planning docs together.
- Put the one-pager, founder letter, hiring plan, investor update template, and other company-operating docs together.
- Put the final `.xlsx` model or Google Sheet in the financial folder.
- Put the final deck in the pitch deck folder.
- Put generated logos, mockups, launch graphics, and exported assets in the brand folder.
- Put the rendered Remotion video in the video folder.
- Put QA summaries, artifact indexes, and any final summary docs in the QA and handoff folder.
- If a folder contains many related documents, use consistent numbering or naming prefixes so the reading order is obvious.
- If Drive organization is unavailable, mirror this folder structure locally inside the repo as closely as practical and report the Drive failure as a hard blocker.
- In the final handoff, provide the top-level Drive folder link, the most important subfolder or file links, plus the local artifact links.

## Execution Order

Use this sequence by default unless a strong reason requires a different order:

1. Create the live Linear project and implementation tickets.  
2. Lock the startup story, canonical company facts, and shared terminology.  
3. Create the core docs, financial model, investor deck, and brand asset plan.  
4. Build the merged frontend experience for marketing, login, and app routes.  
5. Build the native iOS and macOS apps.  
6. Create the live Figma artifact or the required FigJam round trip if that is the available path.  
7. Generate and organize the required business artifacts locally, then externalize them to Google Drive.  
8. Run the merged web application locally and verify it in the in-app browser preview.  
9. Deploy the merged web application to Vercel.  
10. Run verification and QA across artifacts and live links, using `Computer Use` for real UI and live artifact checks.  
11. Create the polished Tracepad.ai pitch video near the end of the run.  
12. Complete investor outreach steps near the end of the run.  
13. Provide the final handoff with a clear completion summary and delta report.

## Computer Use Workflow

Use [@Computer Use](plugin://computer-use@openai-bundled) as the visual operator and final-mile verifier, not just as an optional extra.

For local web verification, use [@browser-use](plugin://browser-use@openai-bundled) as the required plugin path to test the web app whenever it is available, and treat the in-app browser preview as the default first browser target.

Use it in these places:

* After the merged web frontend is built:
  * start the local web app
  * use [@browser-use](plugin://browser-use@openai-bundled) to open and test the local app in the in-app browser preview first, before using other local browser paths or relying on deployment-only verification
  * verify the marketing site
  * verify the `sign up` or login entry point
  * log in with the required test credentials
  * verify the transition from marketing site to authenticated product app
  * verify major in-app views visually
  * use `Computer Use` for the local-browser pass when possible

* After native apps are built:
  * use [@Computer Use](plugin://computer-use@openai-bundled) to launch and interact with the macOS app
  * use [@Computer Use](plugin://computer-use@openai-bundled) to help verify the iOS simulator flow when available
  * check for layout problems, missing assets, broken navigation, low-contrast UI, and obvious UX issues that build output alone will not catch

* After external artifacts are created:
  * open Google Drive artifacts and confirm they exist and render correctly
  * confirm the Figma or FigJam artifact exists and is visually present
  * confirm the Linear project and issues exist in the live UI when needed
  * confirm the Vercel deployment renders correctly in a real browser

* During final QA:
  * capture screenshots or other visual evidence for the QA report and final handoff
  * use it to confirm that any claimed "verified" flow was actually inspected in a live interface
  * when it materially improves the demo, use `Computer Use` across multiple apps in the same verification pass to show the system working together rather than as isolated pieces

Examples of good multi-app `Computer Use` moments:

* browser + deployed Tracepad app + Google Drive artifact checks in one pass
* Xcode + Simulator for iOS verification
* browser + Linear + Drive to confirm backlog, artifacts, and deployed product are all live
* macOS app + browser or Drive when showing how a generated deliverable appears in the product and in the final exported destination

Rules:

* Do not rely only on code inspection, build success, or API-level success when `Computer Use` can verify the real user-facing result
* For local web verification, use [@browser-use](plugin://browser-use@openai-bundled) and try the in-app browser preview before other browser paths unless that preview is blocked or unavailable
* Prefer [@Computer Use](plugin://computer-use@openai-bundled) near the end of each major workstream, especially web app verification, native app verification, external artifact verification, and final QA
* When appropriate, prefer a small number of strong multi-app walkthroughs over many disconnected single-screen checks
* Do not force multi-app choreography when a simpler focused verification pass is clearer
* If `Computer Use` is blocked by permissions, environment limits, or app state, report that explicitly in the implementation log, QA report, and final handoff

## Artifact Destination Rules

Use one clear destination per artifact class:

* the local repo artifact set as the minimum required destination for docs, spreadsheets, decks, rendered videos, exported business assets, and handoff materials  
* Google Drive as the required mirrored destination for business artifacts after the local files exist
* one merged web frontend project for the marketing site and product app  
* one Vercel project for the deployed web experience  
* one Linear project for planning and implementation tracking  
* one live Figma design file when the write path is available, or one live FigJam workflow artifact when only that narrower path is available  
* one GitHub repo for source code, build inputs, setup instructions, QA notes, and artifact indexes

## Artifact Completion Rules

Treat each artifact class as done only when these conditions are met:

* Docs: built with [@documents](plugin://documents@openai-primary-runtime) as rich, beautifully formatted artifacts, linked in the handoff, and mirrored to Google Drive
* Financial model: built with [@spreadsheets](plugin://spreadsheets@openai-primary-runtime), visually complete, formula-checked, saved locally as a real `.xlsx` file, linked directly in the final handoff, and mirrored to Google Drive
* Pitch deck: built with [@presentations](plugin://presentations@openai-primary-runtime), visually verified, saved locally as a real `.pptx` file, linked directly in the final handoff, and mirrored to Google Drive  
* Pitch video: built through a local `Remotion` code-and-render workflow and exported as a polished `.mp4`, with Drive upload treated as an externalization step rather than the core completion gate  
* Brand assets: created with `Imagegen`, organized locally as real files, and mirrored to Google Drive
* Frontend: merged into one web application, login flow works, deployment is live on Vercel, and the core flow was visually checked with `Computer Use`  
* Linear: live project exists, implementation tickets were created before work, and statuses were updated through the run  
* Figma: live design file exists if the design-write path is available; otherwise the fallback FigJam round trip was completed and reported accurately  
* Native apps: build verification completed for macOS and iOS where possible, with [@Computer Use](plugin://computer-use@openai-bundled) used for live interaction where available and exact blockers documented when not possible

Do not count a described artifact as complete unless a real local artifact or live surface exists. If a required live external mirror is unavailable, classify it under the blocker policy; Google Drive, GitHub, Linear, and Vercel failures are hard blockers.

---

## Suggested Project Structure

Use this as the default root structure:

```text
tracepad-app/
  README.md
  implementation-log.md
  artifact-index.md
  apps/
    web/
    ios/
    macos/
  packages/
    ui/
    core/
    content/
    config/
  docs/
  financials/
  deck/
  brand/
  assets/
  figma/
  linear/
  analytics/
  qa/
  data/
```

## **Company Concept**

### **Name**

Tracepad.ai

### **Tagline**

Capture the work. Ship the report.

### **Core Positioning**

Tracepad.ai helps high-context service businesses capture what happened in the field and turn it into client-ready deliverables.

### **Target Users**

* Independent consultants  
* Field service managers  
* Inspectors and auditors  
* Remodelers and home service businesses  
* Boutique agencies  
* Fractional operators  
* Implementation consultants

### **Core Workflow**

1. Capture voice notes, photos, tasks, and client context.  
2. Organize everything by client, project, and visit.  
3. Generate summaries, reports, proposals, and follow-ups.  
4. Review and edit in the web or macOS workspace.  
5. Share final deliverables with clients.  
6. Track follow-up tasks internally.

## **Startup Story Context**

Use the following startup snapshot and narrative as default context for the company one-pager, financial model, investor deck, website, product copy, and internal planning artifacts unless there is a strong reason to refine it.

### **Company Stage**

* Stage: pre-seed to early seed  
* Founder: solo founder  
* Team: 1 full-time founder plus 2 to 3 part-time contractors  
* Product state: working prototype with early pilots, not broadly launched  
* Fundraising: raising roughly `$1.5M` seed

### **Current Business Snapshot**

Use a believable early-stage operating picture in this range:

* 3 pilot accounts  
* 9 paying customer teams  
* roughly 42 active seats  
* roughly `$3.2k` MRR  
* early usage with meaningful product pull but not polished scale

These numbers can be refined slightly for specific artifacts, but they should remain internally consistent across the package.

### **Canonical Company Facts**

Treat the following as the default source of truth unless there is a clear reason to refine them consistently across all artifacts:

* Founder count: `1`  
* Team shape: `1` full-time founder, `2-3` part-time contractors  
* Pilot accounts: `3`  
* Paying customer teams: `9`  
* Active seats: `42`  
* MRR: approximately `$3.2k`  
* Fundraise target: approximately `$1.5M`  
* Product stage: prototype with early pilots  
* Core ICP: high-context service businesses with messy but repeatable deliverables  
* Pricing shape:
  * Solo: `$49-$79` per month  
  * Team: `$149-$299` per month  
  * Business: `$499+` per month

If you change any of these values for realism or model coherence, update them consistently everywhere instead of drifting between artifacts.

### **Use of Funds**

Default use of funds story:

* hire the first engineer  
* add product and design support  
* improve onboarding and customer success  
* harden the AI and document-generation pipeline  
* run early go-to-market experiments

### **Core Problem**

Tracepad.ai exists because high-context service work gets trapped across:

* voice notes  
* photos  
* memory  
* rough docs  
* texts and follow-ups  
* disconnected task systems

The user's real job is not note-taking. The real job is producing the deliverable:

* report  
* recap  
* proposal  
* scope  
* follow-up  
* internal task list

### **Product Scope**

Keep the believable v1 scope focused on:

1. Capture  
   * voice note  
   * photo attachment  
   * project or client tagging  
   * quick field summary

2. Organize  
   * client  
   * project  
   * visit or field note  
   * related files and context

3. Generate  
   * report draft  
   * proposal draft  
   * follow-up email  
   * task list

4. Review  
   * edit generated output  
   * inspect source context  
   * finalize language

5. Deliver  
   * client-ready portal or export  
   * internal handoff and task routing

### **What The Product Is Not Yet**

To keep the company believable, do not present Tracepad.ai as already having:

* full CRM replacement  
* accounting or invoicing  
* broad enterprise admin depth  
* a mature integrations marketplace  
* complete offline mobile sync  
* heavy workflow automation across many external systems

These can appear in the roadmap, but not as already-finished product reality.

### **Ideal Customer Profile**

Default ICP:

* 5 to 50 person service businesses  
* high-context project work  
* repeatable but messy deliverables  
* founder-led or operator-led buying decision  
* strong need to turn field context into polished client outputs quickly

Good starting customer examples:

* environmental or compliance consultants  
* field inspection and audit teams  
* boutique implementation or operations agencies

### **Business Model**

Use a simple early-stage SaaS model:

* Solo: `$49-$79` per month  
* Team: `$149-$299` per month  
* Business: `$499+` per month  
* optional usage expansion tied to AI-heavy workflows or storage

Keep the pricing believable for an early product that is valuable but not yet enterprise-mature.

### **Shared Terminology**

Use these terms consistently across the package:

* `Client` = the company being served  
* `Project` = the job, engagement, or site effort  
* `Visit` or `Field Note` = raw captured context from a real interaction  
* `Draft` = generated output before review  
* `Deliverable` = final report, proposal, or follow-up sent out  
* `Portal` = client-facing packaged output  
* `Workspace` = the operating surface where everything is reviewed and assembled

Avoid generic or overhyped language such as:

* agent swarm  
* copilot everywhere  
* knowledge graph as a crutch  
* AI-native as filler  
* workspace OS used constantly instead of concrete product language

### **Narrative Spine**

All artifacts should reinforce the same core story:

Tracepad.ai helps high-context service teams capture what happened, structure it quickly, and ship professional deliverables without rebuilding the story by hand.

## **Design Principles**

Use one uniform design system across the marketing website, web app, iOS app, and macOS app.

Tracepad.ai should feel like operational calm:

* trustworthy  
* premium but practical  
* dense enough for real work  
* calm under complexity  
* built for people turning messy field context into client-ready deliverables

Core product design principles:

1. Capture first  
   * The product should always feel ready to collect context quickly.

2. Calm under complexity  
   * Dense is acceptable. Clutter is not.

3. Professional, not startup-cute  
   * Avoid novelty UI, playful SaaS tropes, and generic AI styling.

4. Evidence to deliverable  
   * Every surface should reinforce the same story: capture -> organize -> generate -> review -> deliver.

5. Human review stays visible  
   * AI should feel powerful but reviewable, editable, and grounded in source context.

Cross-platform design rules:

* Web, iOS, and macOS should look like the same company and product.  
* The web app, iOS app, and macOS app should share the same terminology, color system, spacing rhythm, and component logic.  
* The native apps should follow the same overall quality bar, visual intelligence, and product specificity as the web app rather than feeling like thinner companion shells.
* Each platform should still feel native:
  * web for overview, navigation, portals, and coordination  
  * iOS for fast capture and in-the-field actions  
  * macOS for review, editing, and finalization

Visual direction:

* restrained editorial hierarchy  
* minimal chrome  
* clear alignment  
* strong typography  
* image-led moments where appropriate  
* no generic dashboard-card mosaics  
* no decorative gradients behind routine product UI  
* no startup-generic hero visuals
* no bland admin-dashboard compositions with repetitive stat cards and empty white panels

Suggested palette:

* Graphite: `#20252B`  
* Canvas: `#F4F2ED`  
* Signal green: `#1DB56C`  
* Muted blue: `#5D7FA3`  
* Warm amber: `#C88A35`

Typography and layout:

* Use at most two typefaces without a clear reason.  
* Prefer strong, modern sans typography.  
* Use an 8px spacing rhythm.  
* Keep corners between 6px and 8px.  
* Default to cardless layouts where possible.  
* Use cards only when the boundary improves comprehension or interaction.

Interaction rules:

* Use motion sparingly and intentionally.  
* Prioritize orientation, status, and action over decorative flourish.  
* Make the transition from capture to deliverable feel obvious on every platform.

Web-app emphasis:

* The web app should feel more like a high-context operating workspace or command center than a generic SaaS admin panel.
* Use `build-web-apps:frontend-app-builder` to create visual energy through hierarchy, composition, density, contrast, data storytelling, and product-specific surfaces rather than through gimmicks.
* Favor richer layouts such as split views, editorial panels, evidence rails, activity timelines, live draft surfaces, media previews, structured summaries, and strong contextual grouping where appropriate.
* Show more of the product's value directly in the interface: source context, draft outputs, client/project state, deliverable status, and workflow progress.
* Avoid over-relying on a left sidebar plus a grid of interchangeable cards as the primary visual idea.

## **A. Company Docs**

Use [@documents](plugin://documents@openai-primary-runtime) to create very rich, beautifully formatted company docs, operating docs, investor-facing docs, templates, guides, and handoff materials.

Use Google Docs and Google Drive to create polished external document mirrors after the local rich document artifacts exist.

Do not leave these as repo-only markdown files. Mirror every finished document into Google Docs or Drive as part of completion; if that cannot be completed, report the Google Drive failure as a hard blocker.

Use the most appropriate document workflow and formatting for each artifact. These materials should read like real startup operating docs, not raw notes:

* use headings, subheads, tables, callouts, checklists, and concise structured sections where helpful
* make one-pagers actually feel like one-pagers
* make templates and playbooks feel operational and reusable
* make customer-facing or investor-facing docs look presentable enough to share immediately
* use [@documents](plugin://documents@openai-primary-runtime) for document creation, editing, formatting, visual structure, verification, and export rather than producing plain markdown-only drafts when a rich document is required
* do not treat repo-only markdown drafts as final completion when Google Docs is available

Document formatting standard:

* Do not leave important docs as plain pasted paragraphs on a blank page.
* Use clear visual hierarchy: title, subtitle where useful, section headings, subheadings, bullets, numbered lists, and whitespace that makes the document easy to scan.
* Use formatting that matches the artifact type:
  * one-pagers should feel concise, high-signal, and presentation-ready
  * PRDs should have structured sections, tables, scoped lists, and clear acceptance criteria
  * plans and checklists should use checkboxes, tables, owners, dates, and sequencing where useful
  * memos should have a strong opening summary, clear sectioning, and recommendation framing
  * guides and playbooks should feel operational, repeatable, and easy to follow step by step
* Use emphasis, divider spacing, tables, callout blocks, and compact structured layouts where they improve readability.
* Avoid giant uninterrupted text blocks, weak heading structure, inconsistent list formatting, or docs that look like lightly formatted notes.
* The formatting should be polished enough that a founder, operator, or investor could open the document and read it immediately without needing cleanup first.

Document visual QA rule:

* Do not treat document creation as complete based only on generated text or successful file creation.
* Open the finished docs in their real UI when possible and inspect the actual rendered result.
* Check heading hierarchy, spacing, table and callout formatting, list structure, and overall readability.
* Look for overflow, ugly pasted formatting, giant text walls, broken indentation, inconsistent bullets, and other presentation issues that only show up in the rendered document.
* If a document looks like lightly formatted notes instead of a polished operating document, keep iterating before claiming completion.

Create:

1. Company one-pager  
2. Product requirements document for v1  
3. Go-to-market plan  
4. Brand and messaging guide  
5. Customer discovery brief  
6. Launch checklist  
7. Security and privacy posture overview  
8. 90-day execution plan  
9. Investor data room index  
10. Product roadmap  
11. Founder letter  
12. Customer persona pack  
13. Sales one-pager  
14. Demo script  
15. Pilot program brief  
16. Customer onboarding and implementation guide  
17. Competitive positioning memo  
18. Pricing and packaging memo  
19. Security FAQ  
20. Support and operations playbook  
21. Release plan and launch brief  
22. Hiring plan  
23. Board and investor update template

The documents should be concise, realistic, and useful. Avoid filler.

Include fictional but plausible customer discovery notes. Use invented people, companies, and scenarios.

Document destination rule:

* The final version of every document in this section should exist locally as a polished artifact and also as a Google Doc or Google Drive artifact.
* If local drafts or supporting source files are created during execution, keep the polished local file and also upload or recreate the finished documents in Drive.
* Place the finished docs inside the appropriate Drive folder structure rather than leaving them as unorganized loose files.
* In the final handoff, link the local document files directly and include the live Drive artifact links.

PRD requirement:

* The v1 PRD should be detailed enough to drive execution, prioritization, and Linear ticket creation.
* Include product goals, core workflows, user stories, scoped features, non-goals, acceptance criteria, and implementation notes where useful.
* Include the recommended analytics, feature flag, and error-monitoring plan as a dedicated section inside the PRD or a clearly linked companion Google Doc in the same Drive workspace.
* Treat that PRD as one of the main source documents for creating and organizing the Linear backlog.

## **B. Financial Projection**

Use [@spreadsheets](plugin://spreadsheets@openai-primary-runtime) to create a polished 5-year financial model and any supporting spreadsheet work.

The agent must use [@spreadsheets](plugin://spreadsheets@openai-primary-runtime) for workbook creation, editing, formatting, charting, formula work, verification, and export rather than using an ad hoc spreadsheet-generation path.

Do not count a thin, lightly formatted, or weakly structured workbook as complete. The financial model should look like a serious seed-stage SaaS operating model and be polished enough to review with founders or investors.

After creating the model locally first as an `.xlsx` or similar file, upload or recreate the finished model in Google Sheets or Google Drive.

Do not treat a repo-only `.xlsx` as sufficient handoff.

Do not treat the GitHub repo as the only destination for the financial model. Create the live Google Drive or Google Sheets mirror and keep the local `.xlsx` as a first-class artifact.

Local workbook packaging rule:

* The financial model must also exist as a standalone local `.xlsx` workbook that can be opened directly from the repo and surfaced as a first-class artifact in the app UI / sidebar.
* Do not leave the workbook only embedded inside a larger thread context, only in Google Drive, or only as a script source without the generated `.xlsx` file.
* Prefer a stable local path such as `financials/` or `output/spreadsheet/` and link that exact file directly in the final handoff.

The model should clearly answer:

* How many customers do we have?  
* How much do they pay?  
* How much does it cost to serve them, especially AI and storage costs?  
* How much are we spending on people and growth?  
* How long does our cash last?

Required tabs:

1. Executive Summary  
2. Assumptions  
3. Customer Growth  
4. Revenue Model  
5. Pricing & Packaging  
6. COGS / Service Costs  
7. Headcount Plan  
8. OpEx  
9. P\&L  
10. Cash Runway  
11. Scenarios  
12. Charts

At a minimum, the workbook structure should cover:

* Assumptions  
* Customer growth  
* Revenue  
* COGS  
* Headcount  
* Operating expenses  
* P\&L  
* Cash runway

Model assumptions:

* SaaS subscription business  
* Individual, Team, and Business tiers  
* AI usage costs tied to captured notes, photos, summaries, generated reports, and proposal drafts  
* Reasonable churn, expansion, CAC, conversion, and gross margin assumptions  
* Seed-stage runway view  
* Conservative, base, and aggressive cases

The model should explicitly represent:

1. Customers  
   * Active paying customers  
   * New customers added each month  
   * Customers lost each month through churn

2. Pricing / revenue per customer  
   * Subscription price per month  
   * Different plans where relevant, such as solo, team, and agency or business  
   * Any setup fees or extra usage fees

3. Monthly recurring revenue  
   * MRR  
   * ARR  
   * Expansion revenue from customers upgrading seats or plans

4. Sales and marketing  
   * Leads generated  
   * Conversion rate from lead to customer  
   * Customer acquisition cost  
   * Marketing spend  
   * Sales commissions if any

5. Churn and retention  
   * Monthly logo churn  
   * Revenue churn  
   * Retention rate

6. Cost of serving customers  
   * AI model or inference costs  
   * Storage costs for photos, audio, and documents  
   * Cloud hosting  
   * Customer support and onboarding  
   * Third-party software costs tied to usage

7. Team / headcount  
   * Founders  
   * Engineering and product hires  
   * Sales and marketing hires  
   * Customer success or support hires  
   * Salary and benefits by role

8. Operating expenses  
   * Payroll  
   * Software tools  
   * Legal and accounting  
   * Rent or office if any  
   * Travel  
   * General admin costs

9. Profit and loss  
   * Revenue  
   * Cost of goods sold  
   * Gross profit  
   * Operating expenses  
   * Net loss or profit

10. Cash burn and runway  
   * Monthly burn  
   * Ending cash balance each month  
   * Runway in months  
   * When more funding is needed

Verification requirements:

* Formulas calculate correctly  
* No broken references  
* Key assumptions are clearly labeled  
* Charts are readable  
* Executive summary is understandable without inspecting every tab
* The workbook looks complete, organized, and investor-ready rather than skeletal

## **C. Investor Pitch Deck**

Use [@presentations](plugin://presentations@openai-primary-runtime) to create a beautiful, rich, detail-filled 10-12 slide investor pitch deck for the startup.

The agent must use [@presentations](plugin://presentations@openai-primary-runtime) for deck creation, editing, design, rendering, verification, and export rather than using an ad hoc deck-generation path.

Use a local `.pptx` as the canonical editable source unless the presentation plugin provides a stronger native editable presentation path that can also export or preserve the local `.pptx` deliverable.

Do not count a lightly generated or unverified `.pptx` file as complete. The deck should be visually polished, brand-consistent, well-formatted, and verified before handoff.

After creating the deck locally first as a `.pptx` or similar file, upload or recreate the finished deck in Google Slides or Google Drive. The pitch deck should not live only in the repo.

The finished pitch deck must remain available locally as `.pptx`. Do not treat a repo-only `.pptx` as sufficient handoff.

Local deck packaging rule:

* The pitch deck must also exist as a standalone local `.pptx` file that can be opened directly from the repo and surfaced as a first-class artifact in the app UI / sidebar.
* Do not leave the deck only in Google Slides or other live presentation layers without the native local `.pptx` file.
* Prefer a stable local path such as `deck/` or `output/presentations/` and link that exact file directly in the final handoff.

Slide outline:

1. Title: Tracepad.ai  
2. Problem: high-context service work gets trapped in messy notes  
3. Insight: AI can turn field context into client-ready deliverables  
4. Product: capture app \+ workspace \+ desktop studio  
5. Workflow: capture \-\> organize \-\> generate \-\> deliver  
6. Market: service businesses and field consultants  
7. Business model: subscription plus usage expansion  
8. Product traction model: fictional but plausible illustrative operating metrics  
9. GTM: wedge into consultants, agencies, and field teams  
10. Competition: notes apps, CRMs, docs, and vertical tools  
11. Financial summary  
12. Ask and use of funds

Design direction:

* Premium B2B SaaS  
* Practical and field-oriented  
* Clean typography  
* Strong contrast  
* Restraint over hype  
* Use product mockups and generated assets  
* Avoid generic purple AI visuals

## **D. Brand Identity And Marketing Assets**

Use Imagegen to create brand and marketing assets.

The agent must actually use Imagegen for the startup logo, brand assets, website imagery, app imagery, and marketing image deliverables in this section rather than substituting a manual or non-Imagegen fallback by default.

The agent must also use Imagegen to create polished supporting visuals for rich startup artifacts when images improve the result, including document covers or spot illustrations, spreadsheet or financial-model hero graphics, presentation imagery, product mockups, and other doc, Excel, or PowerPoint assets.

Do not count locally assembled placeholder graphics, simple programmatic exports, or non-Imagegen stand-ins as completion for these assets when Imagegen is available.

If Imagegen is unavailable or blocked, report that explicitly as a blocker in the implementation log, QA report, and final handoff.

Create:

1. Logo concept or logo lockup  
2. App icon concept  
3. Landing page hero image  
4. 3 product mockup images  
5. 3 social launch graphics  
6. 2 customer persona visuals  
7. App Store style preview imagery

Logo requirements:

* Generate a real Tracepad.ai logo system, not a placeholder mark.
* At a minimum, create:
  * a primary logo lockup
  * a wordmark
  * a compact mark or icon
  * light and dark usage variants where helpful
* Export the logo assets in practical formats for product and marketing use.
* The logo should feel intentional, legible, and brand-specific rather than generic or empty.
* Do not ship a navbar, hero, app header, or app icon area with a missing, blank, or trivial stand-in logo treatment.
* The generated logo assets should actually be used in the marketing website and relevant product surfaces, not just stored as files.
* If the logo result is weak, generic, visually broken, or absent from the implemented surfaces, treat that as incomplete work rather than acceptable polish.
* The generated app icon and logo assets must also be prepared for native iOS and macOS usage, not only web usage.

Brand direction:

* Trustworthy  
* Operational  
* Field-ready  
* Premium but practical  
* Useful for consultants and small teams

Suggested palette:

* Graphite  
* Off-white  
* Signal green  
* Muted blue  
* Warm amber accents

Avoid:

* Generic purple gradients  
* Fake customer logos  
* Fake press logos  
* Overly abstract AI imagery  
* Stock-photo blandness

Save all assets in brand/ or assets/ with descriptive filenames.

Also upload the final exported brand and marketing assets to Google Drive so the handoff package is available outside the repo.

Create an asset inventory file that lists:

* Filename  
* Purpose  
* Where it is used  
* Prompt or generation notes

## **E. Figma Design System**

Use Figma to create the core design system and product frames.

Preferred path: create a live Figma design file, not just local notes or supporting markdown, but only if the current Figma connector surface actually exposes a design-file write path.

The required design system and product frames must exist as real Figma artifacts inside that file.

Use the strongest available Figma workflow in this order:

1. live Figma design file with editable frames, components, and tokens  
2. live Figma design file with key frames and lighter component structure if full library authoring is not practical  
3. live FigJam artifact that materially helps the product, design review, and handoff when the design-file write path is not available

Do not count local notes, screenshots, or exported descriptions alone as completion for this section.

If the Figma connector or tool path does not allow creating or updating a live design file with frames and components, do not pretend that a web app screen, screenshot, or code export was pushed into Figma as an editable mockup. Report that limitation explicitly in the implementation log, QA report, and final handoff, then fall back to the strongest real FigJam artifact the connector can support.

If full design-file authoring is unavailable but FigJam creation and readback are available, use that narrower path as an additional bidirectional proof point rather than skipping Figma entirely:

* after the core company narrative, product workflow, and implementation direction are established  
* create a richer FigJam fallback bundle for Tracepad.ai, not just one token board  
* read that artifact bundle back into Codex  
* use it to refine the implementation, docs, or Linear backlog before final handoff
* treat each FigJam artifact as a real working board, not a token placeholder

If only the narrower FigJam path is available, the fallback bundle should include:

* one mature workflow board that maps the product flow, phases, loops, and deliverable logic  
* one screen map / information architecture board that covers marketing, login, dashboard, core app views, iOS capture flow, and macOS studio  
* one component inventory / UI patterns board that captures shared interface primitives, repeated content blocks, and product-specific UI conventions  

The boards should include as many of these supporting elements as the connector supports:

* brand board with logo, icon, palette, and typography direction  
* product architecture or sitemap  
* user journey from marketing -> login -> app -> deliverable  
* screen gallery or review board for the homepage, login, dashboard, iOS capture flow, and macOS studio  
* annotations tying implementation decisions back to the product narrative  
* links or references to the live web deployment, local artifacts, deck, and key docs when possible

FigJam quality bar:

* The board must be mature enough to help an operator, designer, engineer, or investor understand the product and workflow at a glance.
* Do not generate a trivial single-row chain, bare five-box flow, or other low-information placeholder board and call the Figma requirement complete.
* Prefer multi-section boards with grouped areas, branching logic, loops, labeled phases, and explanatory annotations over minimal diagrams.
* Make the board useful for real review and handoff: it should capture system shape, workflow logic, key product surfaces, and the relationships between them.
* When possible, include multiple board sections such as workflow, data model, screen map, component inventory, and operating notes rather than only one diagram.
* Use realistic Tracepad-specific terminology and states rather than generic labels.

This FigJam round trip should happen after the product shape is concrete enough to map, but before final handoff. It is not a prerequisite for starting code and it should not be treated as a substitute for real design-file authoring when the design-file path is available.

If a live design file path is available, create:

1. Brand board  
2. Landing page frame  
3. Login frame  
4. Web app dashboard frame  
5. Report editor or key app detail frame  
6. iOS capture flow frame  
7. macOS studio frame  
8. Component basics:  
   * Buttons  
   * Inputs  
   * Navigation  
   * Cards  
   * Status chips  
   * Note cards  
   * Report blocks  
   * Task rows

If the design system workflow is available, also involve Figma in one or more of these higher-value ways:

* create a lightweight token set or variable structure that matches the product code  
* build a small reusable component library for the shared UI primitives  
* mirror one or more implemented web screens back into Figma so the design artifact reflects the shipped product rather than an unrelated concept  
* use Figma as a review surface for polish passes, spacing corrections, hierarchy adjustments, and cross-platform consistency checks  
* keep names, copy, status labels, and UI patterns aligned with the live product and docs

Mockup rule:

* Only claim that the web app was sent to Figma as a mockup if the available connector surface actually allows writing editable frames into a live Figma design file.
* If that design-file write path is not exposed, do not imply that a FigJam board is a screen mockup.
* In that case, use FigJam for product architecture, workflow mapping, review structure, and implementation alignment instead.

Use the design system across the website and apps.

In the final handoff, include direct links to the live Figma design file or FigJam board and call out exactly what was created there, not just a generic file link.

## **F. Marketing Website**

Build a polished public marketing site.

Use `build-web-apps:frontend-app-builder` for the marketing website so the result feels deliberate, premium, image-led where appropriate, and non-generic.

The marketing website and web app should be one connected product experience, not two disconnected projects.

When a user first arrives on the marketing site, they should be able to choose a clear sign up or log in path and then enter the web app from the same overall experience.

The marketing site should feel fully written and presentation-ready, not like a thin shell around the product.

Brand usage expectations:

* Use the generated logo assets in the site header or navbar, and anywhere else the brand should naturally appear.
* Make sure the logo treatment is visually complete and not just text plus a generic dot or temporary shape.
* Ensure the header, hero, and key brand moments feel polished and complete in screenshots and live verification.

Preferred implementation:

* Next.js or Vite React  
* TypeScript  
* Responsive CSS  
* Reusable components  
* Clean project structure  
* Real assets from the brand work

Required sections:

1. Hero  
2. Product workflow  
3. Use cases  
4. Product screenshots or mockups  
5. Customer stories using fictional companies  
6. Pricing  
7. Security/privacy notes  
8. FAQ  
9. Sign up and login entry point into the product  
10. Waitlist/interest form  
11. Footer

Marketing content expectations:

* Build out the copy with enough depth that the site feels like a real startup website, not a placeholder landing page.
* The hero, workflow, use cases, pricing, customer stories, FAQ, and security sections should all contain specific believable material.
* Use the startup story, PRD, customer personas, pricing memo, and other Drive docs to enrich the site copy so the marketing language feels grounded.
* Include enough visual and textual substance that a reviewer could understand the product, customer, pricing, and value proposition without leaving the page immediately.
* Favor strong product storytelling, realistic screenshots or mockups, and concrete examples over generic claims.

Authentication / entry requirements:

* Provide a sign up or log in path from the marketing site into the web app  
* Use a simple test authentication flow if needed for the prototype  
* Support the test credentials:
  * username: `test@gmail.com`
  * password: `test`
* The transition from the marketing site into the product should feel intentional and integrated, not like jumping between unrelated apps

Interest form fields:

* Name  
* Email  
* Company  
* Role  
* Team size  
* Primary use case  
* Platform interest

Form requirements:

* Client-side validation  
* Confirmation state  
* Local persistence using a simple backend, JSON file, SQLite, or project-appropriate storage  

The landing page should feel like a real company website, not a template.

Follow the shared design principles above and avoid generic SaaS composition.

## **Prototype Functionality Standard**

The web app, iOS app, and macOS app should be functional, polished prototypes built around believable mock data and local prototype logic.

For this run, "functional" means:

* the apps build successfully
* the apps launch successfully where possible
* the primary workflows are clickable end to end
* core capture, review, editing, and navigation flows work with seeded or local data
* the user can create new primary records through the UI for the main workflow, not only inspect pre-seeded examples
* the product feels coherent and usable without requiring production backend infrastructure
* the main surfaces are not dead-shell UI

For this run, it is acceptable to use:

* seeded demo accounts
* local persistence
* mock but believable client, project, field note, report, proposal, and task data
* simulated AI outputs that are realistic and well presented
* prototype auth and client portal logic

For this run, do not imply completion of:

* production multi-user auth infrastructure
* cross-platform live sync
* real cloud storage and media pipelines
* production AI orchestration
* production billing or customer administration

Rules:

* Use believable mock data rather than empty states for the main product story.
* Use one shared cross-platform demo dataset so the same clients, projects, field notes, reports, proposals, and tasks appear consistently across web, iOS, and macOS unless there is a clear platform-specific reason not to.
* The web app must support creation flows for the main objects in the product story, not just browsing and editing seeded examples.
* At a minimum, the web app should let a user create new clients, new projects, new field notes, and new attached evidence or assets through coherent UI flows.
* Those creation flows may use local persistence, seeded defaults, prototype storage, or simulated backend behavior, but they must exist as real working interactions.
* Keep placeholders limited to clearly secondary surfaces such as settings, future admin areas, or low-priority integrations.
* Do not present non-functional buttons, broken flows, or disconnected screens as complete.
* Do not present a read-only shell with only seeded records as a complete product workflow.
* If a workflow is simulated, make the simulation coherent and realistic instead of vague.
* Treat inconsistent seeded data across platforms as a product-coherence failure that should be fixed before handoff.

## **G. Web Product App**

Build a v1 dashboard/workspace/client portal product.

Use `build-web-apps:frontend-app-builder` for the web app UI so the product surface is calm, dense, restrained, and visually coherent with the marketing site without becoming marketing-heavy.

Push the frontend skill to make the web app feel visually strong, product-specific, and exciting to click through, while still remaining credible for professional use.

The web product app should be reachable through the marketing site login or sign up flow rather than only as a separate standalone surface.

The marketing site and web product should be implemented as one deployable web application rather than two separately deployed frontends.

Recommended route shape:

* `/` for the marketing site  
* `/login` for the prototype auth flow  
* `/app` and nested routes for the product experience

Required views:

1. Dashboard overview  
2. Clients/projects list  
3. Client detail  
4. Project detail  
5. Field notes inbox  
6. Note detail  
7. Generated report editor  
8. Proposal/follow-up draft view  
9. Task board  
10. Client portal preview  
11. Settings placeholder

Required creation and management flows:

1. Create a new client  
2. Create a new project under a client  
3. Create a new field note or visit entry  
4. Add supporting evidence such as photos, files, or linked assets to the note or project  
5. Generate or refresh a draft report / follow-up from captured context  
6. Edit and save the resulting draft  
7. Create or assign follow-up tasks from the note or draft workflow

Seed realistic data:

* 5 fictional clients  
* 8 fictional projects  
* 15 field notes  
* 5 generated reports  
* 10 tasks  
* 3 proposal drafts  
* 3 client portal examples

Important:

* The web app should feel like a real product.  
* Common workflows should be clickable.  
* Avoid dead-end buttons where reasonable.  
* Include useful empty, loading, and error states.  
* Keep the UI dense enough for repeated professional use.  
* Reuse brand tokens from the design system.
* Preserve a coherent logged-in experience after entering from the marketing site.
* Make the main product flows functional with believable mock data rather than static screenshots or disconnected placeholder screens.
* Do not default to a bland internal tool layout with a dark sidebar and rows of generic summary cards.
* Make the dashboard and key views visually engaging through stronger composition, clearer prioritization, richer content blocks, and more product-specific interface moments.
* Use realistic evidence, draft snippets, progress states, media, summaries, and workflow context to create a more compelling first impression.
* The dashboard should feel like a working operations surface that immediately shows what happened, what matters, and what should ship next.
* The product should not feel locked to the initial dataset; users should be able to add new work through the UI and see it reflected in the product state.

## **H. Vercel Deployment**

Use the `Vercel` plugin to deploy the merged web application after implementation and verification.

Deployment requirements:

* Before deploying, start the merged web application locally and preview it in the in-app browser
* Verify the local marketing -> login -> app flow before relying on the deployed URL
* Deploy the unified frontend, not separate marketing-site and web-app deployments  
* A verified Vercel preview URL is sufficient for completion unless the run explicitly requires a production deployment or custom domain  
* Ensure the deployed app includes the marketing site, login flow, and product routes in one project  
* Configure any required environment variables if the implementation depends on them  
* Verify the deployment loads and that the marketing site -> login -> app path works on the deployed URL  
* Include the final Vercel deployment URL in the handoff

## **I. iOS App**

Use the Build iOS Apps plugin.

Build a SwiftUI iOS app prototype for Tracepad.ai.

iOS scope rule:

* Do not try to cover too many mobile features at the expense of polish.
* It is better to ship a smaller number of highly polished, usable, native-feeling flows than a broad but thin mobile app.
* Prioritize the most believable mobile jobs to be done: capture, quick review, and lightweight follow-up.
* If needed, reduce secondary screens so the core iOS experience feels excellent.

Native execution rule:

* The agent may implement iOS and macOS in parallel where that helps, especially for shared product concepts, copy, flows, and seeded data.  
* Native build, run, simulator interaction, and [@Computer Use](plugin://computer-use@openai-bundled) verification should be done one platform at a time rather than assuming both can be actively verified in Xcode simultaneously.  
* Prefer verifying the macOS app before the iOS app unless there is a clear reason to reverse the order.  
* If Xcode, simulator, or [@Computer Use](plugin://computer-use@openai-bundled) constraints prevent parallel native verification, continue back to back and report that explicitly in the implementation log, QA report, and final handoff.

Priority iOS flows:

1. Today / capture home  
2. Record note or capture screen  
3. Add photo/context flow  
4. Field notes inbox  
5. Note detail with AI summary and next actions

Optional supporting screens if quality remains high:

1. Project/client selector  
2. Tasks generated from note  
3. Settings/profile placeholder

Implementation expectations:

* SwiftUI  
* Local seeded data  
* Brand-consistent visual system  
* Real navigation  
* Realistic interactions  
* Buildable Xcode project  
* Simulator verification
* [@Computer Use](plugin://computer-use@openai-bundled) interaction testing in the simulator when available
* Main capture and note-review flows should be functionally clickable with believable mock data
* Use the same underlying demo clients, projects, and note/report language as the web app so the product feels like one coherent system
* Follow the web app design principles closely in hierarchy, typography, spacing, and content richness while still feeling native to iOS
* Do not settle for thin list-and-form shells or obviously lower-fidelity companion views
* The iOS app should feel polished and usable enough that a person would actually want to demo it on a phone
* Favor stronger visual polish, better spacing, better typography, clearer capture affordances, and more deliberate motion/feedback over additional low-value screens
* Ensure strong text/background contrast across the app and avoid washed-out text, low-contrast controls, or unreadable surfaces in the real simulator window
* Check for layout collisions, clipped text, and other readability issues in the live rendered UI rather than inferring quality from code alone
* If there is a tradeoff between breadth and polish, choose polish
* Use the generated `Imagegen` brand assets for the iOS app icon and relevant in-app brand moments
* Do not leave the iOS app with the default placeholder icon, blank icon, or generic temporary asset

## **J. macOS App**

Use the Build macOS Apps plugin.

Build a SwiftUI macOS app for the Tracepad.ai desktop studio.

Required screens:

1. Sidebar with projects and clients  
2. Field notes list  
3. Report editor  
4. Proposal editor  
5. Template library  
6. Export/share placeholder  
7. Settings placeholder

Design expectations:

* Desktop-first  
* Productivity-oriented  
* Native macOS navigation patterns  
* Optimized for editing, reviewing, and finalizing generated content  
* Brand-consistent but not web-like
* Follow the same design intelligence and polish standard as the web app, adapted for desktop workflows
* Use richer content structure, better hierarchy, stronger editing surfaces, and more deliberate composition than a simple dark split view with sparse panels
* Make the desktop studio feel premium, information-rich, and presentation-ready rather than merely functional
* Ensure strong text/background contrast across the app and avoid unreadable surfaces such as white text on white or near-white backgrounds
* Use system-aware foreground and background styling so the interface remains readable in the actual rendered macOS window rather than only in code or mockups
* Use the generated `Imagegen` brand assets for the macOS app icon and relevant in-app brand moments
* Do not leave the macOS app with the default placeholder icon, blank icon, or generic temporary asset

Verification:

* Build the app locally  
* Run it if possible  
* Use [@Computer Use](plugin://computer-use@openai-bundled) to test the launched macOS app when available
* Document build/run instructions
* Make the main review and editing flows functionally clickable with believable mock data
* Use the same underlying demo clients, projects, field notes, and report/proposal content as the web and iOS apps so the cross-platform story is consistent
* Verify that the generated native app icons appear correctly in the built apps where visible

## **K. Linear Backlog**

Use Linear to create a realistic product and engineering backlog.

Create a live Linear project for Tracepad.ai, not just a local backlog document.

Before implementing the product and company package, first create the implementation todo list in Linear as actionable issues grouped under the appropriate project, epic, or equivalent structure.

The initial Linear tickets should be derived from the PRD and related Google Docs rather than invented independently from scratch.

Use that Linear project as the source of truth while working:

* create the initial implementation tickets before building  
* move tickets into the appropriate in-progress state while working  
* update tickets to done when the corresponding work is finished  
* capture known limitations, bugs, and follow-up work as remaining open issues

Do not count local notes, markdown exports, or repo-only backlog seeds as completion for this section when the Linear path is available.

If the Linear connector or tool path does not allow creating or updating a live project and issues, report that explicitly as a blocker in the implementation log, QA report, and final handoff.

Create epics or equivalent groupings:

1. Marketing site  
2. Web app dashboard  
3. iOS capture app  
4. macOS report studio  
5. Brand and assets  
6. QA and polish

Create actionable issues for remaining work, known limitations, bugs, and next product iterations.

In the final handoff, include direct links to the live Linear project, epics, and issues that were created or updated.

## **L. Analytics And Observability**

Do not make analytics or observability implementation a required engineering deliverable for this run.

Instead, document the recommended analytics, feature flag, and error-monitoring plan for Tracepad.ai in the detailed PRD in Google Docs or in a clearly linked companion Google Doc that sits next to the PRD in Drive.

This should be treated as documentation, not a required live integration.

At a minimum, document:

* the event taxonomy
* recommended feature flags
* the key product funnel and activation metrics to track
* the major error and monitoring surfaces to watch
* where instrumentation would logically live in the product if implemented later
* how a future engineering team should extend the plan

This documentation should help inform backlog shape, prioritization, and future Linear tasks, but it does not need to be implemented during this run.

The doc should cover:

1. Waitlist funnel events  
2. Activation events  
3. Feature flags  
4. Error monitoring  
5. Basic product metrics plan

Events to define:

* waitlist\_submitted  
* note\_captured  
* photo\_added  
* report\_generated  
* proposal\_created  
* client\_portal\_shared  
* task\_created\_from\_note

Feature flags to define:

* ai\_report\_editor  
* client\_portal\_preview  
* macos\_template\_library  
* ios\_voice\_capture\_v2

Do not claim that analytics vendors, SDKs, dashboards, or live monitoring were implemented unless they were actually configured and verified.

## **M. GitHub**

Use the GitHub plugin to create a clean committed codebase.

Requirements:

* Initialize or use an appropriate repository.  
* Commit the completed code and artifact indexes.  
* Include a useful README.  
* Include setup/run instructions.  
* Include QA notes.  
* Include links to external artifacts.  
* Include clear commit messages.

The GitHub repo should contain the source project, reproducible build inputs, and artifact indexes, but it is not the primary storage location for final company docs, spreadsheets, decks, or handoff assets; Google Drive is the required external handoff location for those business artifacts.

Do not commit secrets, tokens, generated dependency folders, or machine-local junk.

## **N. QA And Verification**

Use [@Computer Use](plugin://computer-use@openai-bundled), [@browser-use](plugin://browser-use@openai-bundled), and Playwright.

Use [@Computer Use](plugin://computer-use@openai-bundled) as the default tool for visual and interactive QA whenever the goal is to confirm what a real user would see or click.

Native app QA requirement:

* Use [@Computer Use](plugin://computer-use@openai-bundled) to test the iOS app in the simulator when the simulator path is available.
* Use [@Computer Use](plugin://computer-use@openai-bundled) to test the macOS app after it launches when the launch path is available.
* If [@Computer Use](plugin://computer-use@openai-bundled) cannot be used for either native app because of permissions, simulator state, environment limits, or app launch failure, record the exact blocker in `implementation-log.md`, `qa/qa-report.md`, and the final handoff.

Local web preview requirement:

* Run the merged web application locally before final handoff.
* Use [@browser-use](plugin://browser-use@openai-bundled) to open the local app in the in-app browser preview first and test the marketing site, login flow, and authenticated app experience there.
* Use [@Computer Use](plugin://computer-use@openai-bundled) for this local pass when possible.
* Only fall back to another local browser path first if the in-app browser preview is unavailable or blocked.
* Do not rely only on deployed verification if the local preview flow was not checked.

Verify:

1. Local marketing site loads in the in-app browser preview  
2. Local marketing -> login -> app flow works in the in-app browser preview  
3. Marketing site works on desktop  
4. Marketing site works on mobile  
5. Waitlist form validates  
6. Waitlist form submits  
7. Waitlist submission persists  
8. Web product app loads  
9. Dashboard navigation works  
10. Seed data renders correctly  
11. Report editor is usable  
12. Client portal preview renders  
13. No major console errors  
14. Generated assets display correctly  
15. iOS app builds  
16. iOS simulator run works  
17. iOS app text and controls have clear contrast against their backgrounds  
18. iOS app has no obvious layout collisions or clipped text in the live simulator window  
19. macOS app builds  
20. macOS app text and controls have clear contrast against their backgrounds  
21. Spreadsheet formulas work  
22. Deck is readable  
23. Docs are complete
24. Live external artifacts open correctly in their real UI
25. Screenshots or visual QA evidence were captured for key flows

Create a QA report in qa/qa-report.md with:

* What was tested  
* What passed  
* Bugs found  
* Fixes applied  
* Remaining known limitations
* Visual verification evidence gathered with [@Computer Use](plugin://computer-use@openai-bundled)

Artifact-specific verification checklist:

* Website:
  * [@browser-use](plugin://browser-use@openai-bundled) local in-app browser preview checked  
  * local marketing -> login -> app transition verified  
  * desktop rendering checked  
  * mobile rendering checked  
  * marketing -> login -> app transition verified  
  * [@Computer Use](plugin://computer-use@openai-bundled) walkthrough completed  
  * no major console errors

* Web app:
  * key views render correctly  
  * seeded data appears correctly  
  * logged-in state behaves coherently  
  * [@Computer Use](plugin://computer-use@openai-bundled) interaction completed on key screens  
  * no major console errors

* iOS app:
  * build verified  
  * simulator run verified if possible  
  * [@Computer Use](plugin://computer-use@openai-bundled) interaction completed if the simulator path is available  
  * text, controls, and key surfaces checked for readable contrast in the live simulator window  
  * no obvious layout collisions or clipped text remain on key screens  
  * exact blocker recorded if simulator run is not possible

* macOS app:
  * build verified  
  * launch verified if possible  
  * [@Computer Use](plugin://computer-use@openai-bundled) interaction completed if the app launches  
  * text, controls, and key surfaces checked for readable contrast in the live window  
  * exact blocker recorded if launch is not possible

* Financial model:
  * key tabs rendered visually  
  * formula errors scanned  
  * executive summary and charts reviewed

* Pitch deck:
  * rendered preview reviewed slide by slide  
  * formatting, branding, and readability checked

* Docs:
  * docs opened in their real UI when possible  
  * heading hierarchy reviewed  
  * paragraph spacing and whitespace reviewed  
  * spacing and list formatting reviewed  
  * tables, callouts, and structured sections used where appropriate  
  * no overflow or ugly pasted formatting remains  
  * no major pasted-note formatting failures remain

* Google Drive:
  * required live links verified for docs, model, deck, video, and assets
  * missing required Drive links treated as hard blockers, not optional externalization gaps
  * `Computer Use` used for visual open-and-check verification where possible

* Linear:
  * live project verified  
  * implementation tickets verified  
  * status transitions verified

* Vercel:
  * deployed URL verified  
  * `Computer Use` walkthrough completed on the live deployment  
  * marketing -> login -> app flow verified on the deployment

## **O. Pitch Video**

Near the end of the process, create a polished short pitch video for Tracepad.ai using `Remotion`.

Pitch video requirements:

* Use a `Remotion` code-based workflow to build the video locally  
* Treat this as a rendered media artifact, not a text-only script deliverable  
* Create a short polished startup pitch video that matches the same company story, design language, and terminology used everywhere else  
* Use the existing brand system, generated assets, product visuals, screenshots, and deck narrative where useful  
* Include motion, layout, pacing, and transitions that feel investor-ready rather than generic  
* Render the final output as an `.mp4`  
* Upload the rendered video to Google Drive
* Include the Google Drive link to the final video in the handoff

Remotion behavior:

* If there is no dedicated hosted Remotion connector tool, use the available Remotion skill guidance and build the video locally in the repo as a code-and-render workflow  
* Do not claim completion unless the final video was actually rendered  
* Do not leave the final video only in the repo; if the Google Drive upload path fails, report it as a hard blocker
* If the Remotion workflow or render path is blocked, report that explicitly in the implementation log, QA report, and final handoff

## **P. Investor Outreach**

At the end of the process, use `Gmail` and `Google Calendar` to prepare the investor outreach follow-up.

Email requirements:

* Use the `Gmail` plugin  
* Recipient email: `swimforlyfe@hotmail.com`  
* Investor name: `Joe Smith`  
* Sender signoff name: `Derrick`  
* Subject: `Tracepad.ai: turning field notes into client-ready deliverables`

Email body:

Hi Joe,

I'm building Tracepad.ai, an AI workspace for consultants and service businesses that turns messy field context like voice notes, photos, and site visit details into polished reports, proposals, and follow-ups.

The idea is simple: instead of spending hours rebuilding the story after the work is done, teams can capture what happened in the field and turn it into client-ready deliverables much faster.

Deck: [pitch deck link]

Best,
Derrick

Email behavior:

* Prefer a clickable hyperlink for the deck text if the Gmail path supports it  
* If hyperlink formatting is not available, include the deck URL inline  
* Prepare and send the email near the end of the run as part of the default delivery flow
* Do not ask the user for explicit approval before sending this email.

Calendar invite requirements:

* Use the `Google Calendar` plugin  
* Create an event titled `Tracepad.ai Pitch`  
* Invite `swimforlyfe@hotmail.com`  
* Date: April 30, 2026  
* Start time: `9:00 AM`  
* End time: `9:30 AM`  
* Timezone: `America/New_York`  
* Description: `A short introduction to Tracepad.ai and the pitch deck.`

Calendar behavior:

* Create the invite near the end of the run as part of the default delivery flow  
* Include the resulting calendar event link in the final handoff if created

## **Q. Automations**

At the end of the process, create recurring automations for ongoing project hygiene and polish.

Automation requirements:

* Create these automations against the Tracepad.ai workspace or thread as appropriate.
* Use clear short names.
* Default them to active unless the user explicitly asks otherwise.
* Report the created automation status in the final handoff.
* If automation creation is unavailable or blocked, report that explicitly in the implementation log and final handoff.

Create these recurring automations:

1. Daily artifact audit  
   * Run once per day in the morning.
   * Check for missing or stale Drive artifacts, missing links, missing logos/icons, missing screenshots, and docs promised by the prompt but not actually created.
   * Produce a concise summary of gaps or drift.

2. Daily Linear hygiene  
   * Run once per day.
   * Review the Linear project for stale in-progress work, duplicates, obvious status mismatches, and follow-up bugs that should be opened from QA notes or implementation gaps.
   * Produce a concise summary of recommended ticket updates.

3. Daily polish sweep  
   * Run once per day.
   * Review the web app, marketing site, and native-app outputs for placeholder visuals, weak copy, missing brand assets, low-polish screens, generic UI patterns, and regressions from the prompt quality bar.
   * Focus especially on logo/icon usage, web-app composition, iOS polish, macOS polish, and cross-platform consistency.
   * Produce a concise summary of polish issues and the most important next improvements.

Preferred cadence:

* Daily artifact audit: morning
* Daily Linear hygiene: midday
* Daily polish sweep: evening

## **R. Final Handoff**

Only after the completion persistence rule has been satisfied, provide a concise handoff with:

1. A clear summary of what was done overall  
2. What was created  
3. Links to live artifacts in Google Docs, Sheets, Slides, Drive, Figma, Linear, GitHub, Vercel, and pitch video surfaces  
4. Local file paths for all artifacts  
5. How to run the merged web application  
6. The key entry routes, including the marketing entry and product entry paths  
7. How to build/run the iOS app  
8. How to build/run the macOS app  
9. Where brand assets live  
10. What analytics/observability plan was documented  
11. Deployed Vercel URL  
12. What was committed to GitHub  
13. Known limitations  
14. Recommended next steps
15. A delta report with:
    * completed as requested  
    * completed with fallback  
    * blocked  
    * not attempted
16. Investor outreach status, including:
    * whether the Gmail email was drafted or sent  
    * whether the calendar invite was created  
    * the relevant email or calendar links when available
17. Pitch video status, including:
    * whether the Remotion video was rendered successfully  
    * the local output path  
    * the Google Drive video link
18. Automation status, including:
    * whether the daily artifact audit was created
    * whether the daily Linear hygiene automation was created
    * whether the daily polish sweep was created
    * the relevant automation links or references when available

The final handoff should begin with a short, plain-English executive summary of the completed work so a reader can understand the outcome before reviewing artifact links and implementation details.

For company docs, financials, pitch deck, spreadsheets, and other business handoff materials, prefer live external artifact links when the connector surface supports them, but always include the local repo artifact paths as first-class handoff targets too.

## **Quality Bar**

The finished package should feel coherent.

The docs, financial model, deck, brand, website, apps, Linear backlog, and GitHub repo should all describe the same company, the same product, the same users, and the same strategic direction.

Avoid disconnected artifacts.

Tracepad.ai should feel like a real company someone could inspect, run locally, pitch, and continue building.
