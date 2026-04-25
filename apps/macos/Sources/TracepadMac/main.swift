import SwiftUI

@main
struct TracepadMacApp: App {
    var body: some Scene {
        WindowGroup("Tracepad Review Studio") {
            ContentView()
                .frame(minWidth: 1080, minHeight: 720)
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

    var body: some View {
        NavigationSplitView {
            List(Project.allCases, selection: $selection) { project in
                VStack(alignment: .leading, spacing: 3) {
                    Text(project.client)
                        .font(.headline)
                    Text(project.subtitle)
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
                .padding(.vertical, 5)
            }
            .navigationTitle("Clients")
        } content: {
            VStack(alignment: .leading, spacing: 18) {
                Text(selection.client)
                    .font(.largeTitle.weight(.bold))
                Text("Evidence rail")
                    .font(.headline)
                ForEach(selection.evidence, id: \.self) { item in
                    HStack(spacing: 12) {
                        Image(systemName: "doc.text.magnifyingglass")
                            .foregroundStyle(Color(red: 0.114, green: 0.710, blue: 0.424))
                        Text(item)
                    }
                    .padding()
                    .background(.regularMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                }
                Spacer()
            }
            .padding(24)
            .onChange(of: selection) { _, newValue in draft = newValue.draft }
        } detail: {
            VStack(alignment: .leading, spacing: 16) {
                HStack {
                    VStack(alignment: .leading) {
                        Text("Review draft")
                            .font(.title.weight(.bold))
                        Text("Human review remains visible before delivery.")
                            .foregroundStyle(.secondary)
                    }
                    Spacer()
                    Button("Finalize") {}
                        .buttonStyle(.borderedProminent)
                        .tint(Color(red: 0.114, green: 0.710, blue: 0.424))
                }
                TextEditor(text: $draft)
                    .font(.body)
                    .scrollContentBackground(.hidden)
                    .padding()
                    .background(Color.white.opacity(0.86))
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                HStack {
                    Label("7 photos", systemImage: "photo.on.rectangle")
                    Label("4 tasks", systemImage: "checklist")
                    Label("87% source confidence", systemImage: "checkmark.seal")
                }
                .foregroundStyle(.secondary)
            }
            .padding(24)
            .background(Color(red: 0.957, green: 0.949, blue: 0.929))
        }
    }
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

    var evidence: [String] {
        switch self {
        case .harbor:
            ["Voice note 3m 12s", "7 roof photos", "Client asked about May maintenance window", "Task: confirm warranty language"]
        case .cedar:
            ["Inspection checklist", "3 annotated photos", "Draft risk summary", "Task: add remediation owner"]
        case .northline:
            ["Client call transcript", "Implementation notes", "Proposal delta", "Task: send Friday follow-up"]
        }
    }

    var draft: String {
        switch self {
        case .harbor:
            "Inspection Recap\n\nThe north wing roof membrane is intact overall, but seams near the HVAC curb show early wear. Recommend a targeted repair during the May maintenance window. Source photos and voice notes remain attached for review."
        case .cedar:
            "Compliance Walk Summary\n\nCedar Works has three open remediation items. The draft separates required action from optional maintenance and routes owner follow-up for each item."
        case .northline:
            "Implementation Follow-Up\n\nNorthline is ready for phase-two rollout after confirming the support handoff and training sequence. The client-facing proposal should stay concise and operational."
        }
    }
}
