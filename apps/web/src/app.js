const events = [
  {
    id: "visit",
    label: "Visit note",
    title: "North wing roof membrane inspection",
    meta: "Voice note, 7 photos, 4 tasks",
    draft: "Harbor Ridge Retrofit - Inspection Recap\n\nSummary\nThe north wing roof membrane is intact overall, but seams near the HVAC curb show early wear and should be addressed before the next heavy rain cycle.\n\nEvidence\n- Photo 03 shows ponding near the mechanical curb.\n- Voice note timestamp 01:44 identifies a soft edge at the flashing.\n- Client asked whether the repair can be bundled with the May maintenance window.\n\nRecommended next steps\n1. Schedule a targeted seam repair.\n2. Confirm warranty language before client delivery.\n3. Send a concise client recap by Friday."
  },
  {
    id: "proposal",
    label: "Proposal draft",
    title: "May maintenance scope",
    meta: "Generated from prior reports",
    draft: "Proposal Draft - May Maintenance Scope\n\nObjective\nBundle the membrane seam repair with the planned May maintenance visit to minimize disruption and avoid duplicate mobilization.\n\nScope\n- Inspect and clean north wing drains.\n- Repair flashing seams around the HVAC curb.\n- Capture before and after photos for the client portal.\n\nClient language\nThis is a preventive maintenance item, not an emergency repair."
  },
  {
    id: "handoff",
    label: "Task plan",
    title: "Internal crew handoff",
    meta: "4 tasks, 2 owners, due Friday",
    draft: "Internal Handoff\n\nOwner: Riley Chen\nDue: Friday\n\nTasks\n- Pull warranty language from the original install packet.\n- Confirm May site access with Harbor Ridge facilities.\n- Add curb seam detail to the crew brief.\n- Publish final recap to the client portal after review."
  }
];

const timeline = document.querySelector("#timeline");
const draftTitle = document.querySelector("#draft-title");
const draftBody = document.querySelector("#draft-body");
const statusMessage = document.querySelector("#status-message");
const loginDialog = document.querySelector("#login-dialog");
const loginResult = document.querySelector("#login-result");

function renderTimeline(selectedId = "visit") {
  timeline.innerHTML = "";
  events.forEach((event) => {
    const button = document.createElement("button");
    button.className = `event${event.id === selectedId ? " selected" : ""}`;
    button.innerHTML = `<strong>${event.title}</strong><small>${event.label} - ${event.meta}</small>`;
    button.addEventListener("click", () => selectEvent(event.id));
    timeline.appendChild(button);
  });
}

function selectEvent(id) {
  const event = events.find((item) => item.id === id) || events[0];
  draftTitle.textContent = event.label;
  draftBody.value = event.draft;
  statusMessage.textContent = `${event.title} is loaded with source context attached.`;
  renderTimeline(event.id);
}

document.querySelectorAll("[data-action='login']").forEach((button) => {
  button.addEventListener("click", () => loginDialog.showModal());
});

document.querySelector("#login-submit").addEventListener("click", (event) => {
  event.preventDefault();
  const email = document.querySelector("#email").value.trim();
  const password = document.querySelector("#password").value.trim();
  if (email === "demo@tracepad.ai" && password === "tracepad-demo") {
    loginResult.textContent = "Demo workspace unlocked. Scroll to the workspace and select a field note.";
    setTimeout(() => {
      loginDialog.close();
      document.querySelector("#workspace").scrollIntoView({ behavior: "smooth", block: "center" });
    }, 550);
  } else {
    loginResult.textContent = "Use demo@tracepad.ai / tracepad-demo for this prototype.";
  }
});

document.querySelectorAll(".rail-item").forEach((button) => {
  button.addEventListener("click", () => {
    document.querySelectorAll(".rail-item").forEach((item) => item.classList.remove("selected"));
    button.classList.add("selected");
    statusMessage.textContent = `${button.textContent} mode selected. The same evidence-to-deliverable workflow stays visible.`;
  });
});

document.querySelector("#regenerate").addEventListener("click", () => {
  draftBody.value += "\n\nRegenerated reviewer note\nKeep the client language practical, cite source photos, and separate recommendation from urgency.";
  statusMessage.textContent = "Draft regenerated with reviewer note added.";
});

document.querySelector("#finalize").addEventListener("click", () => {
  statusMessage.textContent = "Deliverable finalized for portal review. Internal follow-up tasks are queued.";
});

selectEvent("visit");
