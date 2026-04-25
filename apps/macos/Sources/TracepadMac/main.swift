import SwiftUI

@main
struct TracepadMacApp: App {
    var body: some Scene {
        WindowGroup("Tracepad Review Studio") {
            ContentView()
                .frame(minWidth: 1180, minHeight: 760)
                .preferredColorScheme(.light)
        }
        .commands {
            CommandMenu("Deliverable") {
                Button("Finalize Draft") {}
                    .keyboardShortcut("f", modifiers: [.command, .shift])
                Button("Open Client Portal") {}
                    .keyboardShortcut("p", modifiers: [.command])
            }
        }
    }
}

struct ContentView: View {
    @State private var selection: Project = .harbor
    @State private var draft = Project.harbor.draft
    @State private var selectedTab: WorkspaceTab = .draft

    var body: some View {
        NavigationSplitView {
            ProjectSidebar(selection: $selection)
        } content: {
            ProjectBrief(project: selection)
                .onChange(of: selection) { _, newValue in
                    draft = newValue.draft
                    selectedTab = .draft
                }
        } detail: {
            ReviewWorkspace(project: selection, draft: $draft, selectedTab: $selectedTab)
        }
        .tint(TracepadColor.green)
    }
}

private struct ProjectSidebar: View {
    @Binding var selection: Project

    var body: some View {
        List(Project.allCases, selection: $selection) { project in
            HStack(spacing: 10) {
                Circle()
                    .fill(project.accent)
                    .frame(width: 8, height: 8)
                VStack(alignment: .leading, spacing: 3) {
                    Text(project.client)
                        .font(.subheadline.weight(.semibold))
                        .lineLimit(1)
                    Text(project.subtitle)
                        .font(.caption)
                        .lineLimit(1)
                }
            }
            .padding(.vertical, 6)
            .tag(project)
        }
        .listStyle(.sidebar)
        .navigationTitle("Clients")
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                Button {
                } label: {
                    Label("New Capture", systemImage: "plus")
                }
            }
        }
    }
}

private struct ProjectBrief: View {
    let project: Project

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                VStack(alignment: .leading, spacing: 8) {
                    Text(project.client)
                        .font(.system(size: 34, weight: .bold, design: .rounded))
                        .foregroundStyle(TracepadColor.ink)
                        .lineLimit(3)
                    Text(project.subtitle)
                        .font(.headline)
                        .foregroundStyle(TracepadColor.blue)
                }

                HStack(spacing: 10) {
                    StatusPill(text: project.status, color: project.accent)
                    StatusPill(text: project.dueDate, color: TracepadColor.amber)
                }

                MetricStrip(project: project)

                SectionLabel("Evidence rail")
                VStack(spacing: 10) {
                    ForEach(project.evidence) { item in
                        EvidenceCard(item: item)
                    }
                }

                SectionLabel("Internal follow-up")
                VStack(spacing: 8) {
                    ForEach(project.tasks, id: \.self) { task in
                        HStack(spacing: 10) {
                            Image(systemName: "checkmark.circle")
                                .foregroundStyle(TracepadColor.green)
                            Text(task)
                                .font(.subheadline)
                                .foregroundStyle(TracepadColor.ink)
                            Spacer()
                        }
                        .padding(12)
                        .background(TracepadColor.paper)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                    }
                }
            }
            .padding(24)
        }
        .background(TracepadColor.canvas)
    }
}

private struct ReviewWorkspace: View {
    let project: Project
    @Binding var draft: String
    @Binding var selectedTab: WorkspaceTab

    var body: some View {
        VStack(spacing: 0) {
            header

            Divider()

            HStack(spacing: 0) {
                VStack(alignment: .leading, spacing: 16) {
                    Picker("Workspace mode", selection: $selectedTab) {
                        ForEach(WorkspaceTab.allCases) { tab in
                            Text(tab.title).tag(tab)
                        }
                    }
                    .pickerStyle(.segmented)
                    .labelsHidden()

                    editorSurface
                }
                .padding(24)

                Divider()

                Inspector(project: project)
                    .frame(width: 260)
            }
        }
        .background(TracepadColor.detail)
    }

    private var header: some View {
        HStack(alignment: .center, spacing: 18) {
            VStack(alignment: .leading, spacing: 5) {
                Text("Review draft")
                    .font(.system(size: 28, weight: .bold, design: .rounded))
                    .foregroundStyle(TracepadColor.ink)
                Text("Human review stays visible before the deliverable goes to the client portal.")
                    .font(.subheadline)
                    .foregroundStyle(TracepadColor.muted)
            }
            Spacer()
            Button {
                draft += "\n\nReviewer decision\nFinalized for client portal with source evidence attached."
            } label: {
                Label("Finalize", systemImage: "checkmark.seal.fill")
                    .font(.headline)
            }
            .buttonStyle(.borderedProminent)
            .tint(TracepadColor.green)
        }
        .padding(.horizontal, 24)
        .padding(.vertical, 18)
        .background(TracepadColor.paper)
    }

    private var editorSurface: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                VStack(alignment: .leading, spacing: 3) {
                    Text(project.deliverableTitle)
                        .font(.title3.weight(.bold))
                        .foregroundStyle(TracepadColor.ink)
                    Text("Client-ready \(project.deliverableType.lowercased())")
                        .font(.caption.weight(.semibold))
                        .foregroundStyle(TracepadColor.blue)
                }
                Spacer()
                StatusPill(text: "\(project.confidence)% source confidence", color: TracepadColor.green)
            }

            TextEditor(text: $draft)
                .font(.system(size: 15, weight: .regular, design: .default))
                .foregroundStyle(TracepadColor.ink)
                .scrollContentBackground(.hidden)
                .padding(18)
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(TracepadColor.border, lineWidth: 1)
                )

            HStack(spacing: 16) {
                Label("\(project.photos) photos", systemImage: "photo.on.rectangle")
                Label("\(project.tasks.count) tasks", systemImage: "checklist")
                Label(project.reviewer, systemImage: "person.crop.circle")
                Spacer()
            }
            .font(.caption.weight(.semibold))
            .foregroundStyle(TracepadColor.muted)
        }
    }
}

private struct Inspector: View {
    let project: Project

    var body: some View {
        VStack(alignment: .leading, spacing: 18) {
            SectionLabel("Source stack")
            ForEach(project.insights, id: \.self) { insight in
                HStack(alignment: .top, spacing: 10) {
                    Image(systemName: "sparkle.magnifyingglass")
                        .foregroundStyle(TracepadColor.green)
                        .frame(width: 18)
                    Text(insight)
                        .font(.subheadline)
                        .foregroundStyle(TracepadColor.ink)
                        .fixedSize(horizontal: false, vertical: true)
                }
                .padding(12)
                .background(TracepadColor.paper)
                .clipShape(RoundedRectangle(cornerRadius: 8))
            }

            SectionLabel("Portal package")
            VStack(alignment: .leading, spacing: 10) {
                PortalRow(label: "Client summary", ready: true)
                PortalRow(label: "Evidence appendix", ready: true)
                PortalRow(label: "Internal tasks", ready: true)
                PortalRow(label: "Warranty note", ready: project == .harbor)
            }

            Spacer()
        }
        .padding(20)
        .background(TracepadColor.canvas.opacity(0.72))
    }
}

private struct EvidenceCard: View {
    let item: EvidenceItem

    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            Image(systemName: item.icon)
                .foregroundStyle(TracepadColor.green)
                .frame(width: 20)
            VStack(alignment: .leading, spacing: 4) {
                Text(item.title)
                    .font(.subheadline.weight(.semibold))
                    .foregroundStyle(TracepadColor.ink)
                Text(item.detail)
                    .font(.caption)
                    .foregroundStyle(TracepadColor.muted)
                    .fixedSize(horizontal: false, vertical: true)
            }
            Spacer()
        }
        .padding(14)
        .background(TracepadColor.paper)
        .clipShape(RoundedRectangle(cornerRadius: 8))
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(TracepadColor.border, lineWidth: 1)
        )
    }
}

private struct MetricStrip: View {
    let project: Project

    var body: some View {
        HStack(spacing: 10) {
            MetricBlock(value: "\(project.photos)", label: "Photos")
            MetricBlock(value: "\(project.tasks.count)", label: "Tasks")
            MetricBlock(value: "\(project.confidence)%", label: "Confidence")
        }
    }
}

private struct MetricBlock: View {
    let value: String
    let label: String

    var body: some View {
        VStack(alignment: .leading, spacing: 3) {
            Text(value)
                .font(.title2.weight(.bold))
                .foregroundStyle(TracepadColor.ink)
            Text(label)
                .font(.caption.weight(.semibold))
                .foregroundStyle(TracepadColor.muted)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(12)
        .background(TracepadColor.paper)
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}

private struct PortalRow: View {
    let label: String
    let ready: Bool

    var body: some View {
        HStack {
            Image(systemName: ready ? "checkmark.circle.fill" : "circle")
                .foregroundStyle(ready ? TracepadColor.green : TracepadColor.muted.opacity(0.55))
            Text(label)
                .foregroundStyle(TracepadColor.ink)
            Spacer()
        }
        .font(.subheadline)
    }
}

private struct SectionLabel: View {
    let text: String

    init(_ text: String) {
        self.text = text
    }

    var body: some View {
        Text(text)
            .font(.caption.weight(.bold))
            .foregroundStyle(TracepadColor.blue)
            .textCase(.uppercase)
    }
}

private struct StatusPill: View {
    let text: String
    let color: Color

    var body: some View {
        Text(text)
            .font(.caption.weight(.bold))
            .foregroundStyle(TracepadColor.ink)
            .padding(.horizontal, 10)
            .padding(.vertical, 6)
            .background(color.opacity(0.16))
            .clipShape(Capsule())
    }
}

private enum TracepadColor {
    static let ink = Color(red: 0.125, green: 0.145, blue: 0.169)
    static let canvas = Color(red: 0.957, green: 0.949, blue: 0.929)
    static let detail = Color(red: 0.985, green: 0.976, blue: 0.948)
    static let paper = Color(red: 1.0, green: 0.992, blue: 0.972)
    static let green = Color(red: 0.114, green: 0.710, blue: 0.424)
    static let blue = Color(red: 0.365, green: 0.498, blue: 0.639)
    static let amber = Color(red: 0.784, green: 0.541, blue: 0.208)
    static let muted = Color(red: 0.392, green: 0.420, blue: 0.400)
    static let border = Color(red: 0.845, green: 0.824, blue: 0.776)
}

private enum WorkspaceTab: String, CaseIterable, Identifiable {
    case draft
    case evidence
    case portal

    var id: String { rawValue }

    var title: String {
        switch self {
        case .draft: "Draft"
        case .evidence: "Evidence"
        case .portal: "Portal"
        }
    }
}

struct EvidenceItem: Identifiable, Hashable {
    let id = UUID()
    let icon: String
    let title: String
    let detail: String
}

enum Project: String, CaseIterable, Identifiable {
    case harbor
    case cedar
    case northline

    var id: String { rawValue }

    var client: String {
        switch self {
        case .harbor: "Harbor Ridge Retrofit"
        case .cedar: "Cedar Works Audit"
        case .northline: "Northline Implementation"
        }
    }

    var subtitle: String {
        switch self {
        case .harbor: "Roof membrane inspection"
        case .cedar: "Compliance site walk"
        case .northline: "Agency rollout recap"
        }
    }

    var status: String {
        switch self {
        case .harbor: "Ready to finalize"
        case .cedar: "Needs owner review"
        case .northline: "Proposal draft"
        }
    }

    var dueDate: String {
        switch self {
        case .harbor: "Due Friday"
        case .cedar: "Due Monday"
        case .northline: "Due tomorrow"
        }
    }

    var deliverableType: String {
        switch self {
        case .harbor: "Inspection Recap"
        case .cedar: "Compliance Summary"
        case .northline: "Implementation Follow-Up"
        }
    }

    var deliverableTitle: String {
        switch self {
        case .harbor: "North wing inspection recap"
        case .cedar: "Cedar Works compliance summary"
        case .northline: "Northline phase-two follow-up"
        }
    }

    var reviewer: String {
        switch self {
        case .harbor: "Riley reviewing"
        case .cedar: "Mara reviewing"
        case .northline: "Nisha reviewing"
        }
    }

    var photos: Int {
        switch self {
        case .harbor: 7
        case .cedar: 3
        case .northline: 2
        }
    }

    var confidence: Int {
        switch self {
        case .harbor: 87
        case .cedar: 78
        case .northline: 91
        }
    }

    var accent: Color {
        switch self {
        case .harbor: TracepadColor.green
        case .cedar: TracepadColor.amber
        case .northline: TracepadColor.blue
        }
    }

    var evidence: [EvidenceItem] {
        switch self {
        case .harbor:
            [
                EvidenceItem(icon: "waveform", title: "Voice note - 3m 12s", detail: "Inspector called out early seam wear near the HVAC curb."),
                EvidenceItem(icon: "photo.on.rectangle", title: "7 roof photos", detail: "Photo 03 shows ponding; photo 06 captures flashing edge detail."),
                EvidenceItem(icon: "bubble.left.and.text.bubble.right", title: "Client request", detail: "Facilities asked if repair can be bundled into the May maintenance window."),
                EvidenceItem(icon: "doc.text.magnifyingglass", title: "Warranty language", detail: "Original install packet needs one sentence added before delivery.")
            ]
        case .cedar:
            [
                EvidenceItem(icon: "checklist", title: "Inspection checklist", detail: "Three remediation items remain open after the site walk."),
                EvidenceItem(icon: "photo.on.rectangle", title: "3 annotated photos", detail: "Photos show missing label, blocked access panel, and outdated signage."),
                EvidenceItem(icon: "person.line.dotted.person", title: "Owner note", detail: "Operations lead wants a clean owner-by-owner action list.")
            ]
        case .northline:
            [
                EvidenceItem(icon: "phone", title: "Client call transcript", detail: "Rollout blockers are training, support handoff, and final proposal language."),
                EvidenceItem(icon: "doc.text", title: "Proposal delta", detail: "Phase two scope changed from two sites to four sites.")
            ]
        }
    }

    var tasks: [String] {
        switch self {
        case .harbor:
            ["Confirm warranty language", "Schedule seam repair", "Send client recap by Friday", "Attach photo appendix"]
        case .cedar:
            ["Assign remediation owners", "Add compliance deadline", "Send risk summary"]
        case .northline:
            ["Update phase-two proposal", "Send Friday follow-up", "Confirm support owner"]
        }
    }

    var insights: [String] {
        switch self {
        case .harbor:
            ["The repair is preventive, not emergency language.", "Client cares about bundling work into May maintenance.", "Draft should cite photos without overloading the summary."]
        case .cedar:
            ["Separate required remediation from optional cleanup.", "Owner assignment is the biggest missing input.", "Use concise compliance language."]
        case .northline:
            ["Phase-two scope expanded materially.", "Training plan is the decision blocker.", "Keep proposal language operational, not salesy."]
        }
    }

    var draft: String {
        switch self {
        case .harbor:
            """
            Inspection Recap

            The north wing roof membrane is intact overall, but seams near the HVAC curb show early wear. Recommend a targeted seam repair during the May maintenance window so the work can be bundled with planned site access.

            Evidence reviewed
            - Voice note at 01:44 identified a soft edge at the flashing.
            - Photo 03 shows ponding near the mechanical curb.
            - Photo 06 captures the flashing detail for warranty review.

            Recommended next steps
            1. Confirm warranty language from the original install packet.
            2. Schedule the targeted repair during the May maintenance window.
            3. Send the client recap with a photo appendix by Friday.
            """
        case .cedar:
            """
            Compliance Walk Summary

            Cedar Works has three open remediation items after the site walk. The draft separates required action from optional maintenance so the client can assign owners without rereading the full inspection checklist.

            Recommended next steps
            1. Assign one owner to each remediation item.
            2. Confirm deadline language before the summary is shared.
            3. Include the annotated photo appendix in the portal package.
            """
        case .northline:
            """
            Implementation Follow-Up

            Northline is ready for phase-two rollout after confirming the support handoff and training sequence. The updated proposal should reflect the expanded four-site scope and keep the client-facing language practical.

            Recommended next steps
            1. Update the phase-two scope table.
            2. Confirm training owner and support handoff.
            3. Send the Friday follow-up with proposal deltas attached.
            """
        }
    }
}
