import fs from "node:fs";
import path from "node:path";
import { createRequire } from "node:module";

const require = createRequire(import.meta.url);
const pptxgen = require("/Users/derrickchoi/.cache/codex-runtimes/codex-primary-runtime/dependencies/node/node_modules/pptxgenjs/dist/pptxgen.cjs.js");

const root = process.cwd();
const out = path.join(root, "deck", "tracepad-seed-deck.pptx");
const brandDir = path.join(root, "brand");
const img = (name) => path.join(brandDir, name);

const pptx = new pptxgen();
pptx.layout = "LAYOUT_WIDE";
pptx.author = "Tracepad.ai";
pptx.subject = "Seed pitch deck";
pptx.title = "Tracepad.ai Seed Deck";
pptx.company = "Tracepad.ai";
pptx.lang = "en-US";
pptx.theme = {
  headFontFace: "Aptos Display",
  bodyFontFace: "Aptos",
  lang: "en-US"
};

const C = {
  graphite: "20252B",
  canvas: "F4F2ED",
  paper: "FFFDF8",
  green: "1DB56C",
  blue: "5D7FA3",
  amber: "C88A35",
  muted: "6D746F"
};

function title(slide, text, sub) {
  slide.addText(text, { x: 0.55, y: 0.35, w: 8.2, h: 0.55, fontFace: "Aptos Display", fontSize: 25, bold: true, color: C.graphite, margin: 0 });
  if (sub) slide.addText(sub, { x: 0.58, y: 0.92, w: 7.4, h: 0.28, fontSize: 8.5, color: C.blue, bold: true, margin: 0 });
}

function footer(slide, n) {
  slide.addText(`Tracepad.ai / Seed Deck / ${n}`, { x: 0.55, y: 7.05, w: 2.2, h: 0.16, fontSize: 5.5, color: "8A8D88", margin: 0 });
}

function addPill(slide, x, y, text, fill = C.green) {
  slide.addShape(pptx.ShapeType.roundRect, { x, y, w: 1.45, h: 0.34, rectRadius: 0.06, fill: { color: fill }, line: { color: fill } });
  slide.addText(text, { x: x + 0.08, y: y + 0.08, w: 1.29, h: 0.12, fontSize: 6.8, bold: true, color: "FFFFFF", align: "center", margin: 0 });
}

function bullets(slide, items, x, y, w) {
  slide.addText(items.map((t) => ({ text: t, options: { bullet: { type: "bullet" }, breakLine: true } })), {
    x, y, w, h: 3.2, fontSize: 14, color: C.graphite, breakLine: false, fit: "shrink", paraSpaceAfterPt: 12, margin: 0.02
  });
}

function metric(slide, x, y, value, label) {
  slide.addText(value, { x, y, w: 1.55, h: 0.4, fontSize: 21, bold: true, color: C.graphite, margin: 0 });
  slide.addText(label, { x, y: y + 0.46, w: 1.7, h: 0.28, fontSize: 7.5, color: C.muted, margin: 0 });
}

function addImageIfExists(slide, name, x, y, w, h) {
  const p = img(name);
  if (fs.existsSync(p)) slide.addImage({ path: p, x, y, w, h });
}

const slides = [];
for (let i = 0; i < 12; i++) {
  const s = pptx.addSlide();
  s.background = { color: C.canvas };
  slides.push(s);
}

// 1
slides[0].addText("Tracepad.ai", { x: 0.7, y: 0.62, w: 6.4, h: 0.9, fontFace: "Aptos Display", fontSize: 58, bold: true, color: C.graphite, margin: 0 });
slides[0].addText("Capture the work. Ship the report.", { x: 0.76, y: 1.58, w: 5.8, h: 0.38, fontSize: 18, color: C.blue, margin: 0 });
slides[0].addShape(pptx.ShapeType.rect, { x: 0.72, y: 2.35, w: 5.4, h: 0.05, fill: { color: C.green }, line: { color: C.green } });
slides[0].addText("AI workspace for high-context service businesses turning field context into client-ready deliverables.", { x: 0.76, y: 2.68, w: 4.6, h: 0.9, fontSize: 18, color: C.graphite, bold: true, fit: "shrink", margin: 0 });
addImageIfExists(slides[0], "tracepad-hero-field-workspace.png", 7.1, 0.55, 5.3, 5.0);
addPill(slides[0], 0.76, 4.35, "$1.5M seed");
addPill(slides[0], 2.38, 4.35, "3 pilots", C.blue);
addPill(slides[0], 4.0, 4.35, "$3.2k MRR", C.amber);
footer(slides[0], 1);

// 2
title(slides[1], "High-context service work gets trapped before it becomes a deliverable.", "Problem");
bullets(slides[1], ["Voice notes, site photos, texts, and meeting memory scatter across tools.", "The expensive work is reconstructing the story for a client-ready recap, proposal, or task plan.", "Generic note tools capture information but do not ship the final professional output."], 0.8, 1.55, 6.0);
addImageIfExists(slides[1], "tracepad-persona-consultant.png", 7.6, 1.25, 4.4, 3.6);
footer(slides[1], 2);

// 3
title(slides[2], "The insight: AI is most useful when evidence and review stay attached.", "Insight");
slides[2].addShape(pptx.ShapeType.line, { x: 1.15, y: 3.35, w: 10.3, h: 0, line: { color: C.graphite, width: 1 } });
["Capture", "Organize", "Generate", "Review", "Deliver"].forEach((step, i) => {
  const x = 0.9 + i * 2.25;
  slides[2].addShape(pptx.ShapeType.ellipse, { x, y: 2.86, w: 0.86, h: 0.86, fill: { color: i === 3 ? C.green : C.paper }, line: { color: C.graphite } });
  slides[2].addText(String(i + 1), { x: x + 0.29, y: 3.1, w: 0.24, h: 0.16, fontSize: 9, bold: true, color: i === 3 ? "FFFFFF" : C.graphite, margin: 0 });
  slides[2].addText(step, { x: x - 0.24, y: 3.95, w: 1.35, h: 0.26, fontSize: 11, bold: true, color: C.graphite, align: "center", margin: 0 });
});
slides[2].addText("Tracepad.ai is not a black-box writer. It is a reviewable workspace where source context, draft language, and final delivery live together.", { x: 1.1, y: 5.05, w: 10.0, h: 0.58, fontSize: 17, bold: true, color: C.graphite, align: "center", margin: 0 });
footer(slides[2], 3);

// 4
title(slides[3], "Product: capture app + workspace + desktop studio.", "Product");
addImageIfExists(slides[3], "tracepad-product-mockup-ios.png", 0.75, 1.34, 3.45, 2.75);
addImageIfExists(slides[3], "tracepad-product-mockup-web.png", 4.35, 1.02, 4.5, 3.0);
addImageIfExists(slides[3], "tracepad-product-mockup-macos.png", 8.55, 1.48, 3.4, 2.72);
slides[3].addText("iOS captures field context fast. Web coordinates clients, projects, and portals. macOS supports deep review, editing, and finalization.", { x: 1.25, y: 5.15, w: 10.6, h: 0.52, fontSize: 16, bold: true, color: C.graphite, align: "center", margin: 0 });
footer(slides[3], 4);

// 5
title(slides[4], "Workflow: from raw context to client-ready deliverable.", "Workflow");
const workflow = [
  ["Capture", "Voice notes, photos, project tags"],
  ["Organize", "Client, project, visit, source context"],
  ["Generate", "Report, proposal, follow-up, task list"],
  ["Review", "Edit draft with evidence visible"],
  ["Deliver", "Portal/export and internal handoff"]
];
workflow.forEach(([head, body], i) => {
  const x = 0.72 + i * 2.48;
  slides[4].addShape(pptx.ShapeType.roundRect, { x, y: 1.62, w: 2.0, h: 3.25, rectRadius: 0.08, fill: { color: C.paper }, line: { color: "DAD5CA" } });
  slides[4].addText(head, { x: x + 0.18, y: 1.9, w: 1.6, h: 0.28, fontSize: 15, bold: true, color: C.graphite, margin: 0 });
  slides[4].addText(body, { x: x + 0.18, y: 2.46, w: 1.58, h: 1.2, fontSize: 10.5, color: C.muted, fit: "shrink", margin: 0 });
  slides[4].addShape(pptx.ShapeType.rect, { x: x + 0.18, y: 4.28, w: 1.6, h: 0.07, fill: { color: i === 4 ? C.green : C.blue }, line: { color: i === 4 ? C.green : C.blue } });
});
footer(slides[4], 5);

// 6
title(slides[5], "Market wedge: service businesses where deliverables are the product.", "Market");
bullets(slides[5], ["5-50 person service businesses with repeatable but messy deliverables.", "Environmental consultants, field inspection teams, remodelers, boutique implementation agencies, fractional operators.", "Buyer is founder-led or operator-led and feels the follow-up bottleneck directly."], 0.85, 1.55, 6.3);
metric(slides[5], 8.2, 1.7, "5-50", "person ICP");
metric(slides[5], 8.2, 2.75, "4", "core outputs");
metric(slides[5], 8.2, 3.8, "1", "reviewable workspace");
footer(slides[5], 6);

// 7
title(slides[6], "Business model: subscriptions plus usage expansion.", "Business model");
[
  ["Solo", "$69/mo", "Independent consultant"],
  ["Team", "$249/mo", "Small service team"],
  ["Business", "$599+/mo", "Higher-volume operator"]
].forEach(([plan, price, who], i) => {
  const x = 1 + i * 3.8;
  slides[6].addText(plan, { x, y: 1.7, w: 2.4, h: 0.28, fontSize: 15, bold: true, color: C.blue, margin: 0 });
  slides[6].addText(price, { x, y: 2.25, w: 2.6, h: 0.6, fontSize: 32, bold: true, color: C.graphite, margin: 0 });
  slides[6].addText(who, { x, y: 3.08, w: 2.65, h: 0.35, fontSize: 10.5, color: C.muted, margin: 0 });
  slides[6].addShape(pptx.ShapeType.line, { x, y: 3.75, w: 2.8, h: 0, line: { color: C.green, width: 2 } });
});
slides[6].addText("Expansion comes from seats, AI-heavy generation, storage, onboarding, and higher-volume portal workflows.", { x: 1.0, y: 5.05, w: 10.6, h: 0.4, fontSize: 16, bold: true, color: C.graphite, align: "center", margin: 0 });
footer(slides[6], 7);

// 8
title(slides[7], "Plausible prototype traction, not pretend scale.", "Traction model");
metric(slides[7], 1.0, 1.55, "3", "pilot accounts");
metric(slides[7], 3.25, 1.55, "9", "paying teams");
metric(slides[7], 5.5, 1.55, "42", "active seats");
metric(slides[7], 7.75, 1.55, "$3.2k", "MRR");
metric(slides[7], 10.0, 1.55, "$1.5M", "seed ask");
slides[7].addText("The traction story is intentionally early: real pull from service teams, enough usage to learn, and a clear path to stronger onboarding and product hardening.", { x: 1.0, y: 3.35, w: 10.6, h: 0.84, fontSize: 20, bold: true, color: C.graphite, align: "center", margin: 0 });
footer(slides[7], 8);

// 9
title(slides[8], "GTM: wedge into repeated high-context deliverables.", "Go-to-market");
bullets(slides[8], ["Start founder-led with boutique consultants, inspection teams, agencies, and remodelers.", "Sell a narrow promise: ship the recap, proposal, or follow-up before context decays.", "Convert pilots through guided onboarding and measurable reduction in deliverable cycle time."], 0.9, 1.58, 7.2);
addImageIfExists(slides[8], "tracepad-social-launch-2.png", 8.65, 1.35, 3.0, 3.0);
footer(slides[8], 9);

// 10
title(slides[9], "Competition: notes, CRMs, docs, and vertical tools each miss the full loop.", "Competition");
const comps = [["Notes apps", "Capture without deliverable workflow"], ["CRMs", "Track accounts, not field evidence"], ["Docs", "Flexible but manual"], ["Vertical tools", "Deep but narrow"], ["Tracepad.ai", "Evidence to reviewed deliverable"]];
comps.forEach(([name, note], i) => {
  const y = 1.45 + i * 0.75;
  slides[9].addText(name, { x: 1.05, y, w: 2.0, h: 0.24, fontSize: 12, bold: true, color: i === 4 ? C.green : C.graphite, margin: 0 });
  slides[9].addText(note, { x: 3.1, y, w: 6.6, h: 0.24, fontSize: 12, color: C.muted, margin: 0 });
  slides[9].addShape(pptx.ShapeType.line, { x: 1.05, y: y + 0.42, w: 9.8, h: 0, line: { color: "DAD5CA", width: 0.7 } });
});
footer(slides[9], 10);

// 11
title(slides[10], "Financial summary: seed dollars buy product hardening and pilot conversion.", "Financial summary");
slides[10].addChart(pptx.ChartType.line, [
  { name: "ARR", labels: ["2026", "2027", "2028", "2029", "2030"], values: [0.125, 0.52, 1.59, 4.08, 8.32] }
], { x: 0.9, y: 1.55, w: 6.6, h: 3.45, catAxisLabelFontFace: "Aptos", valAxisLabelFontFace: "Aptos", showLegend: false, valAxisTitle: "$M ARR", showValue: false });
bullets(slides[10], ["Base case reaches about $1.6M ARR in 2028.", "Gross margin improves as templates, onboarding, and AI cost controls mature.", "Runway supports focused product and GTM validation, with a planned follow-on raise after stronger usage proof."], 8.05, 1.65, 3.8);
footer(slides[10], 11);

// 12
title(slides[11], "Ask: $1.5M seed to turn field context into the system of record for deliverables.", "Ask and use of funds");
slides[11].addText("$1.5M", { x: 0.95, y: 1.65, w: 3.0, h: 0.72, fontSize: 48, bold: true, color: C.green, margin: 0 });
slides[11].addText("seed target", { x: 1.02, y: 2.42, w: 2.0, h: 0.24, fontSize: 11, color: C.muted, margin: 0 });
bullets(slides[11], ["Hire first engineer.", "Add product and design support.", "Improve onboarding and customer success.", "Harden AI and document generation pipeline.", "Run early GTM experiments."], 4.45, 1.55, 6.5);
slides[11].addText("Tracepad.ai wins by staying practical: capture the messy work, keep evidence attached, and help service teams ship the professional output clients actually pay for.", { x: 1.0, y: 5.45, w: 10.6, h: 0.48, fontSize: 17, bold: true, color: C.graphite, align: "center", margin: 0 });
footer(slides[11], 12);

await fs.promises.mkdir(path.dirname(out), { recursive: true });
await pptx.writeFile({ fileName: out });
console.log(`Generated deck: ${out}`);
