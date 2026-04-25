from __future__ import annotations

import json
from pathlib import Path

from docx import Document
from docx.enum.text import WD_ALIGN_PARAGRAPH
from docx.enum.table import WD_TABLE_ALIGNMENT, WD_CELL_VERTICAL_ALIGNMENT
from docx.shared import Inches, Pt, RGBColor
from openpyxl import Workbook
from openpyxl.chart import LineChart, BarChart, Reference
from openpyxl.styles import Alignment, Border, Font, PatternFill, Side
from openpyxl.utils import get_column_letter
from PIL import Image, ImageDraw, ImageFont

ROOT = Path(__file__).resolve().parents[1]
FACTS = json.loads((ROOT / "packages/content/companyFacts.json").read_text())
DOC_GROUPS = {
    "company": ROOT / "docs/company",
    "product": ROOT / "docs/product",
    "gtm": ROOT / "docs/go-to-market",
    "security": ROOT / "docs/security",
    "ops": ROOT / "docs/operations",
}

GRAPHITE = "20252B"
CANVAS = "F4F2ED"
GREEN = "1DB56C"
BLUE = "5D7FA3"
AMBER = "C88A35"


def add_doc_header(doc: Document, title: str, subtitle: str) -> None:
    section = doc.sections[0]
    section.top_margin = Inches(0.65)
    section.bottom_margin = Inches(0.65)
    section.left_margin = Inches(0.72)
    section.right_margin = Inches(0.72)
    title_p = doc.add_paragraph()
    title_p.alignment = WD_ALIGN_PARAGRAPH.LEFT
    run = title_p.add_run(title)
    run.font.name = "Aptos Display"
    run.font.size = Pt(24)
    run.font.bold = True
    run.font.color.rgb = RGBColor(32, 37, 43)
    sub = doc.add_paragraph()
    sub.paragraph_format.space_after = Pt(12)
    r = sub.add_run(subtitle)
    r.font.name = "Aptos"
    r.font.size = Pt(10.5)
    r.font.color.rgb = RGBColor(93, 127, 163)


def add_callout(doc: Document, label: str, body: str) -> None:
    p = doc.add_paragraph()
    p.paragraph_format.left_indent = Inches(0.18)
    p.paragraph_format.right_indent = Inches(0.18)
    p.paragraph_format.space_before = Pt(8)
    p.paragraph_format.space_after = Pt(14)
    lead = p.add_run(label + "  ")
    lead.bold = True
    lead.font.color.rgb = RGBColor(29, 181, 108)
    text = p.add_run(body)
    text.font.size = Pt(10)


def _shade(fill: str):
    from docx.oxml import OxmlElement
    from docx.oxml.ns import qn

    shd = OxmlElement("w:shd")
    shd.set(qn("w:fill"), fill)
    return shd


def style_doc(doc: Document) -> None:
    styles = doc.styles
    styles["Normal"].font.name = "Aptos"
    styles["Normal"].font.size = Pt(10)
    for name, size, color in [("Heading 1", 17, GRAPHITE), ("Heading 2", 13, BLUE), ("Heading 3", 11, AMBER)]:
        styles[name].font.name = "Aptos"
        styles[name].font.size = Pt(size)
        styles[name].font.bold = True
        styles[name].font.color.rgb = RGBColor.from_string(color)


def add_two_col_table(doc: Document, rows: list[tuple[str, str]], widths=(1.9, 4.9)) -> None:
    table = doc.add_table(rows=1, cols=2)
    table.alignment = WD_TABLE_ALIGNMENT.CENTER
    table.style = "Table Grid"
    hdr = table.rows[0].cells
    hdr[0].text = "Area"
    hdr[1].text = "Detail"
    for cell in hdr:
        cell._tc.get_or_add_tcPr().append(_shade(GRAPHITE))
        for p in cell.paragraphs:
            for r in p.runs:
                r.font.color.rgb = RGBColor(255, 255, 255)
                r.font.bold = True
    for left, right in rows:
        cells = table.add_row().cells
        cells[0].text = left
        cells[1].text = right
    for row in table.rows:
        row.cells[0].width = Inches(widths[0])
        row.cells[1].width = Inches(widths[1])
        for cell in row.cells:
            cell.vertical_alignment = WD_CELL_VERTICAL_ALIGNMENT.CENTER
            for p in cell.paragraphs:
                p.paragraph_format.space_after = Pt(0)
    doc.add_paragraph()


def create_doc(path: Path, title: str, subtitle: str, sections: list[tuple[str, list[str]]], table_rows=None) -> None:
    doc = Document()
    style_doc(doc)
    add_doc_header(doc, title, subtitle)
    add_callout(doc, FACTS["tagline"], FACTS["positioning"])
    if table_rows:
        doc.add_heading("Snapshot", level=1)
        for left, right in table_rows:
            p = doc.add_paragraph(style="List Bullet")
            p.add_run(f"{left}: ").bold = True
            p.add_run(right)
    for heading, bullets in sections:
        doc.add_heading(heading, level=1)
        for bullet in bullets:
            p = doc.add_paragraph(style="List Bullet")
            p.add_run(bullet)
    path.parent.mkdir(parents=True, exist_ok=True)
    doc.save(path)


DOCS = [
    ("company", "tracepad-company-one-pager.docx", "Company One-Pager", "Investor and founder-ready company snapshot", [
        ("What Tracepad.ai does", ["Turns field notes, photos, visits, and client context into polished reports, proposals, follow-ups, and task plans.", "Keeps human review visible so source evidence and generated language stay connected."]),
        ("Current snapshot", ["3 pilot accounts, 9 paying customer teams, 42 active seats, about $3.2k MRR.", "Raising about $1.5M to hire the first engineer, harden document generation, and expand early GTM."]),
        ("Why now", ["AI makes unstructured capture useful, but field teams still need domain-specific review and deliverable workflow."]),
    ]),
    ("product", "tracepad-v1-prd.docx", "Tracepad.ai V1 PRD", "Product requirements for the seed-stage prototype", [
        ("Goals", ["Enable fast capture of voice notes, photos, client/project tags, and visit summaries.", "Generate editable reports, proposals, follow-ups, and task plans grounded in source context."]),
        ("Core workflows", ["Capture -> organize -> generate -> review -> deliver.", "Web coordinates projects and portals; iOS captures in the field; macOS supports review and finalization."]),
        ("Acceptance criteria", ["A user can log in, select a client project, inspect evidence, edit a draft, and finalize a deliverable.", "Analytics track capture created, draft generated, review edited, deliverable finalized, and portal shared."]),
        ("Non-goals", ["No full CRM replacement, accounting, mature integration marketplace, or complete offline sync in V1."]),
    ], [("Primary user", "Founder-led or operator-led service teams with 5-50 people."), ("Test login", "demo@tracepad.ai / tracepad-demo"), ("Instrumentation", "capture_created, draft_generated, draft_edited, deliverable_finalized, portal_shared")]),
    ("gtm", "tracepad-go-to-market-plan.docx", "Go-To-Market Plan", "Focused wedge into consultants, agencies, and field teams", [
        ("Wedge", ["Start with boutique consultants and field inspection teams who already write repetitive client reports.", "Use done-for-you onboarding and pilot conversion instead of self-serve scale."]),
        ("Channels", ["Founder-led outbound to operators, referral loops through consultants, targeted demo webinars, and field-report teardown content."]),
        ("Metrics", ["Pilot-to-paid conversion, weekly captured visits, draft acceptance rate, and deliverable cycle time reduction."]),
    ]),
    ("company", "tracepad-brand-messaging-guide.docx", "Brand And Messaging Guide", "Shared voice, terminology, and visual standards", [
        ("Voice", ["Operational, calm, specific, useful. Avoid generic AI hype and fake enterprise maturity."]),
        ("Terminology", [f"{k}: {v}" for k, v in FACTS["terms"].items()]),
        ("Visual system", ["Graphite, canvas, signal green, muted blue, warm amber; 6-8px radius; minimal chrome; strong type hierarchy."]),
    ]),
    ("company", "tracepad-customer-discovery-brief.docx", "Customer Discovery Brief", "Fictional but plausible pilot learning", [
        ("Interview themes", ["Operators lose time reconstructing field context into client language.", "Photos and voice notes are useful only when tied to final deliverables.", "Reviewability matters more than one-click automation."]),
        ("Invented discovery notes", ["Mara, environmental consultant: wants a defensible recap by the next morning.", "Owen, remodeler: needs fewer text threads and more client-ready scopes.", "Nisha, implementation agency lead: wants task plans tied to meeting evidence."]),
    ]),
    ("ops", "tracepad-launch-checklist.docx", "Launch Checklist", "Sequenced founder launch plan", [
        ("Before launch", ["Finalize demo workspace, publish landing page, confirm support inbox, seed analytics events, prepare pilot onboarding."]),
        ("Launch week", ["Invite pilot cohort, run 3 live demos, capture objections, publish first teardown article."]),
        ("After launch", ["Review activation, ship onboarding fixes, convert first pilots, update investor materials."]),
    ]),
    ("security", "tracepad-security-privacy-overview.docx", "Security And Privacy Overview", "Early-stage posture for sensitive client context", [
        ("Principles", ["Least-privilege access, reviewable AI outputs, source traceability, encrypted storage, clear retention controls."]),
        ("Initial controls", ["Role-based workspace access, audit logs for deliverable sharing, data deletion workflow, model-provider review."]),
    ]),
    ("ops", "tracepad-90-day-execution-plan.docx", "90-Day Execution Plan", "First three months after seed close", [
        ("Days 1-30", ["Hire first engineer, stabilize capture pipeline, close design system gaps."]),
        ("Days 31-60", ["Improve onboarding, add review workflow depth, complete pilot success playbook."]),
        ("Days 61-90", ["Scale founder-led sales experiments, harden portal delivery, publish product metrics."]),
    ]),
    ("company", "tracepad-investor-data-room-index.docx", "Investor Data Room Index", "Investor diligence folder map", [
        ("Company", ["One-pager, founder letter, operating snapshot, hiring plan."]),
        ("Product", ["PRD, roadmap, demo script, QA report, security overview."]),
        ("Financial", ["5-year model, pricing memo, use-of-funds summary."]),
    ]),
    ("product", "tracepad-product-roadmap.docx", "Product Roadmap", "Seed-stage product sequencing", [
        ("Now", ["Capture, evidence rail, draft generation, review, portal delivery."]),
        ("Next", ["Templates by vertical, stronger task routing, richer client portal packages."]),
        ("Later", ["Selective integrations, admin depth, offline improvements, workflow automation."]),
    ]),
    ("company", "tracepad-founder-letter.docx", "Founder Letter", "Narrative memo for early investors and hires", [
        ("Opening", ["High-context service teams do important work, then lose hours turning that work into client-ready language."]),
        ("Belief", ["The winning product is not a note-taker; it is a deliverable workspace grounded in evidence."]),
    ]),
    ("company", "tracepad-customer-persona-pack.docx", "Customer Persona Pack", "ICP, pains, triggers, and objections", [
        ("Primary personas", ["Field consultant, service operations manager, boutique agency operator."]),
        ("Buying triggers", ["Too many late reports, inconsistent client communication, founder bottleneck, repeatable field workflows."]),
    ]),
    ("gtm", "tracepad-sales-one-pager.docx", "Sales One-Pager", "Buyer-facing sales artifact", [
        ("Promise", ["Turn field context into polished deliverables before the story goes cold."]),
        ("Proof points", ["Source-linked drafts, faster follow-up, consistent client language, visible human review."]),
    ]),
    ("product", "tracepad-demo-script.docx", "Demo Script", "Founder-led demo flow", [
        ("Act 1", ["Show messy capture: voice note, photos, tasks, client context."]),
        ("Act 2", ["Generate a report draft and inspect the evidence rail."]),
        ("Act 3", ["Edit, finalize, and publish to a client portal."]),
    ]),
    ("gtm", "tracepad-pilot-program-brief.docx", "Pilot Program Brief", "Pilot structure for early customers", [
        ("Offer", ["Four-week guided pilot for 2-5 active projects and one repeatable deliverable workflow."]),
        ("Success criteria", ["At least 10 captured visits, 5 finalized deliverables, and a measurable reduction in recap time."]),
    ]),
    ("ops", "tracepad-onboarding-guide.docx", "Customer Onboarding And Implementation Guide", "Operational customer setup guide", [
        ("Week 1", ["Import clients/projects, define deliverable templates, train capture workflow."]),
        ("Week 2", ["Run first live projects, review draft quality, tune language guidelines."]),
    ]),
    ("company", "tracepad-competitive-positioning-memo.docx", "Competitive Positioning Memo", "How Tracepad.ai competes", [
        ("Alternatives", ["Notes apps capture context, CRMs track accounts, docs tools write manually, vertical tools solve narrow cases."]),
        ("Difference", ["Tracepad.ai connects field evidence directly to reviewed client deliverables."]),
    ]),
    ("company", "tracepad-pricing-packaging-memo.docx", "Pricing And Packaging Memo", "Early pricing rationale", [
        ("Packages", ["Solo $69/mo, Team $249/mo, Business $599+/mo plus usage expansion."]),
        ("Rationale", ["Price below large vertical suites but above generic note tools because the value is final deliverables."]),
    ]),
    ("security", "tracepad-security-faq.docx", "Security FAQ", "Buyer-facing security answers", [
        ("Data", ["Customer context is workspace-scoped and retained according to customer policy."]),
        ("AI", ["Generated outputs are reviewable and source-linked; sensitive data controls are part of onboarding."]),
    ]),
    ("ops", "tracepad-support-operations-playbook.docx", "Support And Operations Playbook", "First support operating model", [
        ("Support lanes", ["Onboarding, draft quality, capture issues, portal sharing, billing questions."]),
        ("Response targets", ["Same business day for pilots; next business day for standard support."]),
    ]),
    ("ops", "tracepad-release-launch-brief.docx", "Release Plan And Launch Brief", "Initial product release plan", [
        ("Release scope", ["Marketing site, demo workspace, capture/review prototypes, core docs, pitch package."]),
        ("Risks", ["External artifact mirrors, native app build environments, and live deployment credentials."]),
    ]),
    ("company", "tracepad-hiring-plan.docx", "Hiring Plan", "Seed hiring sequence", [
        ("First hires", ["Founding engineer, part-time product designer, customer success/operator contractor."]),
        ("Why", ["Engineering hardens product, design improves onboarding/review, success converts pilots."]),
    ]),
    ("company", "tracepad-investor-update-template.docx", "Board And Investor Update Template", "Monthly investor update format", [
        ("Template", ["Highlights, metrics, customer learning, product shipped, asks, runway, next month priorities."]),
        ("Metrics", ["MRR, active seats, captured visits, generated drafts, finalized deliverables, pilot conversion."]),
    ]),
]


def build_docs() -> list[Path]:
    outputs = []
    for group, filename, title, subtitle, sections, *rest in DOCS:
        path = DOC_GROUPS[group] / filename
        create_doc(path, title, subtitle, sections, rest[0] if rest else None)
        outputs.append(path)
    return outputs


def style_sheet(ws, widths=None):
    ws.sheet_view.showGridLines = False
    thin = Side(style="thin", color="D8D2C5")
    for row in ws.iter_rows():
        for cell in row:
            cell.alignment = Alignment(vertical="center", wrap_text=True)
            cell.border = Border(bottom=thin)
            if cell.row == 1:
                cell.fill = PatternFill("solid", fgColor=GRAPHITE)
                cell.font = Font(color="FFFFFF", bold=True)
    if widths:
        for col, width in widths.items():
            ws.column_dimensions[col].width = width


def build_workbook() -> Path:
    out = ROOT / "financials/tracepad-five-year-model.xlsx"
    wb = Workbook()
    default = wb.active
    wb.remove(default)
    years = [2026, 2027, 2028, 2029, 2030]
    assumptions = {
        "Solo price": 69,
        "Team price": 249,
        "Business price": 599,
        "Starting customers": 9,
        "Starting seats": 42,
        "Starting MRR": 3200,
        "Seed raise": 1500000,
        "Gross margin target": 0.76,
        "Monthly logo churn": 0.025,
        "AI cost per active seat": 8,
        "Storage cost per active seat": 2,
    }
    ws = wb.create_sheet("Executive Summary")
    ws.append(["Metric", "2026", "2027", "2028", "2029", "2030"])
    summary_rows = [
        ("Customers", 28, 86, 205, 430, 760),
        ("Active seats", 126, 430, 1230, 3010, 6080),
        ("ARR", 125000, 520000, 1590000, 4080000, 8320000),
        ("Gross margin", 0.63, 0.68, 0.73, 0.77, 0.79),
        ("Ending cash", 1120000, 410000, -260000, 1040000, 3020000),
    ]
    for row in summary_rows:
        ws.append(row)
    style_sheet(ws, {"A": 22, "B": 14, "C": 14, "D": 14, "E": 14, "F": 14})
    for row in ws.iter_rows(min_row=2, min_col=2):
        for cell in row:
            if cell.row in (4, 6):
                cell.number_format = "$#,##0;[Red]($#,##0);-"
            elif cell.row == 5:
                cell.number_format = "0.0%"
            else:
                cell.number_format = "#,##0"

    ws = wb.create_sheet("Assumptions")
    ws.append(["Assumption", "Value", "Unit", "Notes"])
    for key, value in assumptions.items():
        ws.append([key, value, "$ / count / %", "Canonical prompt-aligned assumption"])
    style_sheet(ws, {"A": 28, "B": 16, "C": 18, "D": 44})

    for name in ["Customer Growth", "Revenue Model", "COGS Service Costs", "Headcount Plan", "OpEx", "P&L", "Cash Runway"]:
        ws = wb.create_sheet(name)
        ws.append(["Line item", *years])
        if name == "Customer Growth":
            rows = [("Beginning customers", 9, 28, 86, 205, 430), ("New customers", 21, 66, 142, 276, 432), ("Logo churn", -2, -8, -23, -51, -102), ("Ending customers", "=B2+B3+B4", "=C2+C3+C4", "=D2+D3+D4", "=E2+E3+E4", "=F2+F3+F4")]
        elif name == "Revenue Model":
            rows = [("Subscription revenue", 88000, 390000, 1210000, 3150000, 6500000), ("Usage expansion", 9000, 54000, 210000, 620000, 1320000), ("Setup / onboarding", 28000, 76000, 170000, 310000, 500000), ("Total revenue", "=SUM(B2:B4)", "=SUM(C2:C4)", "=SUM(D2:D4)", "=SUM(E2:E4)", "=SUM(F2:F4)")]
        elif name == "COGS Service Costs":
            rows = [("AI inference", 21000, 81000, 238000, 570000, 1130000), ("Storage and hosting", 15000, 52000, 150000, 350000, 710000), ("Support and onboarding", 10000, 35000, 98000, 210000, 420000), ("Total COGS", "=SUM(B2:B4)", "=SUM(C2:C4)", "=SUM(D2:D4)", "=SUM(E2:E4)", "=SUM(F2:F4)")]
        elif name == "Headcount Plan":
            rows = [("Founder", 1, 1, 1, 1, 1), ("Engineering", 1, 3, 6, 10, 16), ("Product/design", 1, 2, 3, 5, 8), ("GTM/support", 1, 2, 5, 10, 18), ("Total FTE", "=SUM(B2:B5)", "=SUM(C2:C5)", "=SUM(D2:D5)", "=SUM(E2:E5)", "=SUM(F2:F5)")]
        elif name == "OpEx":
            rows = [("Payroll", 420000, 980000, 1850000, 3350000, 5550000), ("Marketing", 90000, 260000, 620000, 1200000, 2200000), ("G&A / tools", 85000, 150000, 260000, 430000, 710000), ("Total OpEx", "=SUM(B2:B4)", "=SUM(C2:C4)", "=SUM(D2:D4)", "=SUM(E2:E4)", "=SUM(F2:F4)")]
        elif name == "P&L":
            rows = [("Revenue", "='Revenue Model'!B5", "='Revenue Model'!C5", "='Revenue Model'!D5", "='Revenue Model'!E5", "='Revenue Model'!F5"), ("COGS", "='COGS Service Costs'!B5", "='COGS Service Costs'!C5", "='COGS Service Costs'!D5", "='COGS Service Costs'!E5", "='COGS Service Costs'!F5"), ("Gross profit", "=B2-B3", "=C2-C3", "=D2-D3", "=E2-E3", "=F2-F3"), ("OpEx", "='OpEx'!B5", "='OpEx'!C5", "='OpEx'!D5", "='OpEx'!E5", "='OpEx'!F5"), ("Net income", "=B4-B5", "=C4-C5", "=D4-D5", "=E4-E5", "=F4-F5")]
        else:
            rows = [("Opening cash", 1500000, "=B5", "=C5", "=D5+1500000", "=E5"), ("Net income", "='P&L'!B6", "='P&L'!C6", "='P&L'!D6", "='P&L'!E6", "='P&L'!F6"), ("Financing", 0, 0, 0, 1500000, 0), ("Ending cash", "=B2+B3+B4", "=C2+C3+C4", "=D2+D3+D4", "=E2+E3+E4", "=F2+F3+F4")]
        for row in rows:
            ws.append(row)
        style_sheet(ws, {"A": 26, "B": 15, "C": 15, "D": 15, "E": 15, "F": 15})
        for row in ws.iter_rows(min_row=2, min_col=2):
            for cell in row:
                cell.number_format = "$#,##0;[Red]($#,##0);-" if name not in ("Customer Growth", "Headcount Plan") else "#,##0"

    ws = wb.create_sheet("Pricing & Packaging")
    ws.append(["Plan", "Monthly price", "Primary buyer", "Included"])
    for row in [["Solo", 69, "Independent consultant", "Capture, 10 projects, report drafts"], ["Team", 249, "Small service team", "Shared workspace, templates, portal"], ["Business", 599, "Higher-volume operator", "Priority onboarding, usage expansion, admin controls"]]:
        ws.append(row)
    style_sheet(ws, {"A": 18, "B": 16, "C": 28, "D": 46})

    ws = wb.create_sheet("Scenarios")
    ws.append(["Scenario", "2028 ARR", "Gross margin", "Runway note"])
    for row in [["Conservative", 980000, 0.68, "Need bridge before 2029"], ["Base", 1590000, 0.73, "Raise after traction inflection"], ["Aggressive", 2450000, 0.77, "Can support larger seed extension"]]:
        ws.append(row)
    style_sheet(ws, {"A": 18, "B": 16, "C": 16, "D": 38})

    ws = wb.create_sheet("Charts")
    ws.append(["Year", *years])
    ws.append(["ARR", 125000, 520000, 1590000, 4080000, 8320000])
    ws.append(["Customers", 28, 86, 205, 430, 760])
    style_sheet(ws, {"A": 14, "B": 14, "C": 14, "D": 14, "E": 14, "F": 14})
    line = LineChart()
    line.title = "ARR Growth"
    line.y_axis.title = "ARR"
    line.x_axis.title = "Year"
    data = Reference(ws, min_col=2, max_col=6, min_row=2, max_row=2)
    cats = Reference(ws, min_col=2, max_col=6, min_row=1)
    line.add_data(data, from_rows=True, titles_from_data=True)
    line.set_categories(cats)
    ws.add_chart(line, "A6")
    bar = BarChart()
    bar.title = "Customer Growth"
    data = Reference(ws, min_col=2, max_col=6, min_row=3, max_row=3)
    bar.add_data(data, from_rows=True, titles_from_data=True)
    bar.set_categories(cats)
    ws.add_chart(bar, "I6")

    for ws in wb.worksheets:
        ws.freeze_panes = "B2"
    out.parent.mkdir(parents=True, exist_ok=True)
    wb.save(out)
    return out


def build_brand_assets() -> list[Path]:
    out = ROOT / "brand"
    out.mkdir(exist_ok=True)
    svg = ROOT / "apps/web/public/brand/tracepad-mark.svg"
    (out / "tracepad-mark.svg").write_text(svg.read_text())
    paths = [out / "tracepad-mark.svg"]
    specs = [
        ("tracepad-logo-lockup.png", (1200, 520), "Tracepad.ai", "Capture the work. Ship the report."),
        ("tracepad-app-icon.png", (1024, 1024), "T", "Field context to client-ready deliverables"),
        ("tracepad-hero-field-workspace.png", (1600, 1000), "Evidence -> Deliverable", "Field notes, photos, draft, portal"),
        ("tracepad-product-mockup-web.png", (1400, 900), "Web Workspace", "Evidence rail + editable draft"),
        ("tracepad-product-mockup-ios.png", (1200, 900), "iOS Capture", "Voice note, photos, project tag"),
        ("tracepad-product-mockup-macos.png", (1400, 900), "macOS Review Studio", "Review, polish, finalize"),
        ("tracepad-social-launch-1.png", (1200, 1200), "Capture the work", "Ship the report"),
        ("tracepad-social-launch-2.png", (1200, 1200), "From site visit", "to client-ready recap"),
        ("tracepad-social-launch-3.png", (1200, 1200), "Evidence stays attached", "AI drafts stay reviewable"),
        ("tracepad-persona-consultant.png", (1200, 900), "Field Consultant", "Needs defensible recaps fast"),
        ("tracepad-persona-operator.png", (1200, 900), "Service Operator", "Needs follow-up clarity"),
        ("tracepad-app-store-preview.png", (1600, 1000), "Tracepad.ai Capture", "Voice, photos, tasks, draft"),
    ]
    try:
        font_big = ImageFont.truetype("/System/Library/Fonts/Supplemental/Arial Bold.ttf", 72)
        font_med = ImageFont.truetype("/System/Library/Fonts/Supplemental/Arial.ttf", 34)
    except Exception:
        font_big = font_med = None
    for filename, size, title, subtitle in specs:
        img = Image.new("RGB", size, f"#{CANVAS}")
        draw = ImageDraw.Draw(img)
        w, h = size
        draw.rounded_rectangle((48, 48, w - 48, h - 48), radius=36, fill="#FFFDF8", outline=f"#{GRAPHITE}", width=3)
        draw.rectangle((88, 88, 148, h - 88), fill=f"#{GREEN}")
        draw.text((190, 130), title, fill=f"#{GRAPHITE}", font=font_big)
        draw.text((194, 230), subtitle, fill=f"#{BLUE}", font=font_med)
        draw.line((190, h - 190, w - 190, h - 190), fill=f"#{AMBER}", width=8)
        draw.text((190, h - 150), "Prototype with 3 pilots / 9 paying teams / 42 active seats", fill=f"#{GRAPHITE}", font=font_med)
        path = out / filename
        img.save(path)
        paths.append(path)
    web_brand = ROOT / "apps/web/public/brand"
    web_brand.mkdir(parents=True, exist_ok=True)
    for path in paths:
        if path.suffix == ".png":
            (web_brand / path.name).write_bytes(path.read_bytes())
    return paths


if __name__ == "__main__":
    docs = build_docs()
    workbook = build_workbook()
    assets = build_brand_assets()
    print(f"Generated {len(docs)} DOCX files")
    print(f"Generated workbook: {workbook}")
    print(f"Generated {len(assets)} brand fallback assets")
