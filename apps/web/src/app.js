const projects = [
  {
    id: "harbor",
    client: "Harbor Ridge Retrofit",
    subtitle: "Roof membrane inspection",
    status: "Ready to finalize",
    due: "Friday",
    reviewer: "Riley reviewing",
    confidence: 87,
    photos: 7,
    accent: "green",
    note: "North wing roof membrane inspection. HVAC curb flashing has early wear. Client asked if repair can be bundled into May maintenance.",
    draftTitle: "Inspection recap",
    draft: "Inspection Recap\n\nThe north wing roof membrane is intact overall, but seams near the HVAC curb show early wear. Recommend a targeted seam repair during the May maintenance window so the work can be bundled with planned site access.\n\nEvidence reviewed\n- Voice note at 01:44 identified a soft edge at the flashing.\n- Photo 03 shows ponding near the mechanical curb.\n- Photo 06 captures the flashing detail for warranty review.\n\nRecommended next steps\n1. Confirm warranty language from the original install packet.\n2. Schedule the targeted repair during the May maintenance window.\n3. Send the client recap with a photo appendix by Friday.",
    sources: [
      { label: "Voice note", value: "3m 12s", detail: "Inspector called out early seam wear near the HVAC curb." },
      { label: "Roof photos", value: "7 attached", detail: "Photo 03 shows ponding; photo 06 captures flashing edge detail." },
      { label: "Client request", value: "May window", detail: "Facilities asked if repair can be bundled into planned maintenance." }
    ],
    evidence: [
      { title: "Voice note timestamp 01:44", detail: "Soft edge at flashing; inspector recommends preventive repair.", confidence: "High" },
      { title: "Photo 03", detail: "Ponding near mechanical curb visible from north wing roofline.", confidence: "High" },
      { title: "Warranty packet", detail: "Original install language needs one sentence before delivery.", confidence: "Medium" }
    ],
    tasks: [
      { id: "warranty", label: "Confirm warranty language", owner: "Riley", done: true },
      { id: "repair", label: "Schedule seam repair", owner: "Ops", done: false },
      { id: "recap", label: "Send client recap by Friday", owner: "Mara", done: false },
      { id: "appendix", label: "Attach photo appendix", owner: "Tracepad", done: true }
    ],
    packageItems: [
      { id: "summary", label: "Client summary", done: true },
      { id: "evidence", label: "Evidence appendix", done: true },
      { id: "tasks", label: "Internal tasks", done: true },
      { id: "warranty", label: "Warranty note", done: false }
    ]
  },
  {
    id: "cedar",
    client: "Cedar Works Audit",
    subtitle: "Compliance site walk",
    status: "Needs owner review",
    due: "Monday",
    reviewer: "Mara reviewing",
    confidence: 78,
    photos: 3,
    accent: "amber",
    note: "Compliance site walk found three remediation items: label replacement, access panel clearance, and updated signage. Operations needs clear owners.",
    draftTitle: "Compliance summary",
    draft: "Compliance Walk Summary\n\nCedar Works has three open remediation items after the site walk. The client-ready summary should separate required action from optional maintenance so the client can assign owners without rereading the full inspection checklist.\n\nRecommended next steps\n1. Assign one owner to each remediation item.\n2. Confirm deadline language before the summary is shared.\n3. Include the annotated photo appendix in the portal package.",
    sources: [
      { label: "Checklist", value: "11 items", detail: "Three remediation items remain open after the site walk." },
      { label: "Annotated photos", value: "3 attached", detail: "Missing label, blocked access panel, outdated signage." },
      { label: "Owner note", value: "Ops lead", detail: "Operations asked for a clean owner-by-owner action list." }
    ],
    evidence: [
      { title: "Inspection checklist", detail: "Required remediation separated from optional cleanup.", confidence: "High" },
      { title: "Photo 02", detail: "Access panel clearance issue visible in corridor B.", confidence: "High" },
      { title: "Operations note", detail: "Client needs owners assigned before Monday review.", confidence: "Medium" }
    ],
    tasks: [
      { id: "owners", label: "Assign remediation owners", owner: "Ops", done: false },
      { id: "deadline", label: "Add compliance deadline", owner: "Mara", done: false },
      { id: "risk", label: "Send risk summary", owner: "Tracepad", done: true }
    ],
    packageItems: [
      { id: "summary", label: "Client summary", done: true },
      { id: "evidence", label: "Evidence appendix", done: true },
      { id: "owners", label: "Owner table", done: false },
      { id: "risk", label: "Risk note", done: true }
    ]
  },
  {
    id: "northline",
    client: "Northline Implementation",
    subtitle: "Agency rollout recap",
    status: "Proposal draft",
    due: "Tomorrow",
    reviewer: "Nisha reviewing",
    confidence: 91,
    photos: 2,
    accent: "blue",
    note: "Phase two rollout expanded to four sites. Client wants training sequence and support handoff confirmed before proposal delivery.",
    draftTitle: "Implementation follow-up",
    draft: "Implementation Follow-Up\n\nNorthline is ready for phase-two rollout after confirming the support handoff and training sequence. The updated proposal should reflect the expanded four-site scope and keep the client-facing language practical.\n\nRecommended next steps\n1. Update the phase-two scope table.\n2. Confirm training owner and support handoff.\n3. Send the Friday follow-up with proposal deltas attached.",
    sources: [
      { label: "Call transcript", value: "22 min", detail: "Training, support handoff, and proposal scope were the decision blockers." },
      { label: "Proposal delta", value: "4 sites", detail: "Phase two changed from two locations to four." },
      { label: "Support note", value: "Owner needed", detail: "Client needs a named support owner before approving rollout." }
    ],
    evidence: [
      { title: "Client call transcript", detail: "Four-site expansion confirmed by COO during rollout recap.", confidence: "High" },
      { title: "Proposal delta", detail: "Scope table needs updated site count and enablement timeline.", confidence: "High" },
      { title: "Support handoff", detail: "Training owner still missing from internal plan.", confidence: "Medium" }
    ],
    tasks: [
      { id: "scope", label: "Update phase-two scope table", owner: "Nisha", done: false },
      { id: "training", label: "Confirm training owner", owner: "Client", done: false },
      { id: "followup", label: "Send Friday follow-up", owner: "Tracepad", done: true }
    ],
    packageItems: [
      { id: "summary", label: "Client summary", done: true },
      { id: "delta", label: "Proposal delta", done: true },
      { id: "training", label: "Training plan", done: false },
      { id: "handoff", label: "Support handoff", done: false }
    ]
  }
];

const state = {
  authenticated: localStorage.getItem("tracepad-demo-auth") === "true",
  activeProjectId: "harbor",
  mode: "capture",
  reviewMode: "draft",
  recording: false,
  includePhotos: true,
  activity: ["Workspace opened", "Sources synced from mobile capture"]
};

const $ = (selector) => document.querySelector(selector);
const $$ = (selector) => Array.from(document.querySelectorAll(selector));

const publicSite = $("#public-site");
const appShell = $("#app-shell");
const loginDialog = $("#login-dialog");
const loginResult = $("#login-result");

function activeProject() {
  return projects.find((project) => project.id === state.activeProjectId) || projects[0];
}

function setAuthenticated(value) {
  state.authenticated = value;
  localStorage.setItem("tracepad-demo-auth", value ? "true" : "false");
  document.body.classList.toggle("is-authenticated", value);
  publicSite.setAttribute("aria-hidden", value ? "true" : "false");
  appShell.setAttribute("aria-hidden", value ? "false" : "true");
  if (value) renderWorkspace();
}

function addActivity(message) {
  state.activity = [message, ...state.activity].slice(0, 6);
  renderActivity();
}

function renderWorkspace() {
  const project = activeProject();

  $("#workspace-title").textContent = project.client;
  $("#workspace-subtitle").textContent = project.subtitle;
  $("#metric-status").textContent = project.status;
  $("#metric-photos").textContent = state.includePhotos ? project.photos : "Off";
  $("#metric-tasks").textContent = project.tasks.length;
  $("#metric-confidence").textContent = `${project.confidence}%`;
  $("#metric-due").textContent = project.due;
  $("#draft-heading").textContent = project.draftTitle;
  $("#confidence-value").textContent = `${project.confidence}%`;
  $("#confidence-meter").style.width = `${project.confidence}%`;
  $("#capture-note").value = project.note;
  $("#draft-editor").value = project.draft;
  $("#photo-toggle").checked = state.includePhotos;
  $("#review-badge").textContent = project.reviewer;

  renderProjects();
  renderSources();
  renderEvidence();
  renderTasks();
  renderPackage();
  renderActivity();
  renderModes();
}

function renderProjects() {
  const container = $("#project-list");
  container.innerHTML = "";
  projects.forEach((project) => {
    const button = document.createElement("button");
    button.className = `project-button ${project.id === state.activeProjectId ? "selected" : ""}`;
    button.dataset.project = project.id;
    button.innerHTML = `
      <span class="project-dot ${project.accent}"></span>
      <span><strong>${project.client}</strong><small>${project.subtitle}</small></span>
      <em>${project.confidence}%</em>
    `;
    container.appendChild(button);
  });
}

function renderSources() {
  const project = activeProject();
  $("#source-stack").innerHTML = project.sources.map((source) => `
    <article class="source-card">
      <div><strong>${source.label}</strong><span>${source.value}</span></div>
      <p>${source.detail}</p>
    </article>
  `).join("");
}

function renderEvidence() {
  const project = activeProject();
  $("#evidence-feed").innerHTML = project.evidence.map((item) => `
    <article class="evidence-row">
      <div><strong>${item.title}</strong><span>${item.confidence}</span></div>
      <p>${item.detail}</p>
    </article>
  `).join("");
}

function renderTasks() {
  const project = activeProject();
  $("#task-feed").innerHTML = project.tasks.map((task) => `
    <label class="task-row">
      <input type="checkbox" data-task="${task.id}" ${task.done ? "checked" : ""} />
      <span><strong>${task.label}</strong><small>${task.owner}</small></span>
    </label>
  `).join("");
}

function renderPackage() {
  const project = activeProject();
  $("#portal-checklist").innerHTML = project.packageItems.map((item) => `
    <label class="package-row">
      <input type="checkbox" data-package="${item.id}" ${item.done ? "checked" : ""} />
      <span>${item.label}</span>
    </label>
  `).join("");
}

function renderActivity() {
  $("#activity-log").innerHTML = state.activity.map((item) => `<p>${item}</p>`).join("");
}

function renderModes() {
  $$(".app-nav button").forEach((button) => {
    button.classList.toggle("selected", button.dataset.mode === state.mode);
  });
  $$(".review-tabs button").forEach((button) => {
    button.classList.toggle("selected", button.dataset.review === state.reviewMode);
  });
  $$(".workspace-panel").forEach((panel) => {
    panel.classList.toggle("spotlight", panel.dataset.panel === state.mode || state.mode === "tasks" && panel.dataset.panel === "review");
  });
  $("#draft-editor").classList.toggle("hidden", state.reviewMode !== "draft");
  $("#evidence-feed").classList.toggle("hidden", state.reviewMode !== "evidence");
  $("#task-feed").classList.toggle("hidden", state.reviewMode !== "tasks");
}

function updateProjectField(field, value) {
  const project = activeProject();
  project[field] = value;
}

function generateDraft() {
  const project = activeProject();
  const note = $("#capture-note").value.trim();
  project.note = note;
  project.draft = `${project.draftTitle}\n\nGenerated from latest field capture\n${note}\n\nRecommended next steps\n${project.tasks.map((task, index) => `${index + 1}. ${task.label}.`).join("\n")}\n\nReviewer note\nKeep language practical, cite attached evidence, and separate client-facing recommendations from internal work.`;
  state.reviewMode = "draft";
  $("#draft-editor").value = project.draft;
  addActivity(`Generated new ${project.draftTitle.toLowerCase()} for ${project.client}`);
  renderModes();
}

document.addEventListener("click", (event) => {
  const loginTrigger = event.target.closest("[data-action='login']");
  if (loginTrigger) {
    loginDialog.showModal();
    return;
  }

  const projectButton = event.target.closest("[data-project]");
  if (projectButton) {
    state.activeProjectId = projectButton.dataset.project;
    state.includePhotos = true;
    addActivity(`Opened ${activeProject().client}`);
    renderWorkspace();
    return;
  }

  const navButton = event.target.closest("[data-mode]");
  if (navButton) {
    state.mode = navButton.dataset.mode;
    if (state.mode === "evidence") state.reviewMode = "evidence";
    if (state.mode === "tasks") state.reviewMode = "tasks";
    if (state.mode === "review") state.reviewMode = "draft";
    addActivity(`${navButton.textContent} workspace selected`);
    renderModes();
    return;
  }

  const reviewButton = event.target.closest("[data-review]");
  if (reviewButton) {
    state.reviewMode = reviewButton.dataset.review;
    renderModes();
    return;
  }
});

$("#login-submit").addEventListener("click", (event) => {
  event.preventDefault();
  const email = $("#email").value.trim();
  const password = $("#password").value.trim();
  if (email === "demo@tracepad.ai" && password === "tracepad-demo") {
    loginResult.textContent = "Workspace unlocked.";
    setTimeout(() => {
      loginDialog.close();
      setAuthenticated(true);
    }, 250);
  } else {
    loginResult.textContent = "Use demo@tracepad.ai / tracepad-demo for this prototype.";
  }
});

$("#logout").addEventListener("click", () => {
  setAuthenticated(false);
  addActivity("Logged out");
});

$("#record-button").addEventListener("click", () => {
  state.recording = !state.recording;
  $("#record-button").textContent = state.recording ? "■" : "●";
  $("#record-button").setAttribute("aria-label", state.recording ? "Stop recording" : "Start recording");
  addActivity(state.recording ? "Recording started" : "Recording stopped");
});

$("#photo-toggle").addEventListener("change", (event) => {
  state.includePhotos = event.target.checked;
  $("#metric-photos").textContent = state.includePhotos ? activeProject().photos : "Off";
  addActivity(state.includePhotos ? "Photo set attached" : "Photo set removed");
});

$("#capture-note").addEventListener("input", (event) => {
  updateProjectField("note", event.target.value);
});

$("#draft-editor").addEventListener("input", (event) => {
  updateProjectField("draft", event.target.value);
});

$("#generate-draft").addEventListener("click", generateDraft);
$("#sync-button").addEventListener("click", () => addActivity("Mobile, desktop, and portal sources synced"));

function finalizePackage() {
  const project = activeProject();
  project.status = "Finalized";
  project.packageItems.forEach((item) => { item.done = true; });
  addActivity(`${project.client} finalized for client portal`);
  renderWorkspace();
}

$("#finalize-top").addEventListener("click", finalizePackage);

$("#portal-checklist").addEventListener("change", (event) => {
  const input = event.target.closest("[data-package]");
  if (!input) return;
  const item = activeProject().packageItems.find((entry) => entry.id === input.dataset.package);
  if (item) item.done = input.checked;
  addActivity(`${item?.label || "Package item"} ${input.checked ? "completed" : "reopened"}`);
});

$("#task-feed").addEventListener("change", (event) => {
  const input = event.target.closest("[data-task]");
  if (!input) return;
  const task = activeProject().tasks.find((entry) => entry.id === input.dataset.task);
  if (task) task.done = input.checked;
  addActivity(`${task?.label || "Task"} ${input.checked ? "completed" : "reopened"}`);
});

setAuthenticated(state.authenticated);
if (!state.authenticated) renderWorkspace();
