import SwiftUI

public struct TracepadCaptureRootView: View {
    @State private var selectedClient: FieldClient = .harbor
    @State private var noteText = FieldClient.harbor.seedNote
    @State private var includePhotos = true
    @State private var recording = false
    @State private var draftReady = true

    public init() {}

    public var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 18) {
                    hero
                    clientPicker
                    capturePanel
                    evidenceStrip
                    reviewDraft
                    portalPackage
                }
                .padding(.horizontal, 18)
                .padding(.top, 16)
                .padding(.bottom, 32)
            }
            .background(TracepadIOSColor.canvas)
            .navigationTitle("Tracepad")
            .modifier(CompactNavigationTitleModifier())
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button {
                        draftReady = true
                    } label: {
                        Label("Sync", systemImage: "arrow.triangle.2.circlepath")
                    }
                    .tint(TracepadIOSColor.green)
                }
            }
        }
        .tint(TracepadIOSColor.green)
    }

    private var hero: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 6) {
                    Text("Field capture")
                        .font(.system(size: 34, weight: .bold, design: .rounded))
                        .foregroundStyle(TracepadIOSColor.ink)
                    Text("Turn voice, photos, and client context into a reviewable recap before you leave the site.")
                        .font(.subheadline)
                        .foregroundStyle(TracepadIOSColor.muted)
                        .fixedSize(horizontal: false, vertical: true)
                }
                Spacer()
                Image(systemName: "waveform.badge.magnifyingglass")
                    .font(.title2.weight(.semibold))
                    .foregroundStyle(TracepadIOSColor.green)
                    .frame(width: 44, height: 44)
                    .background(TracepadIOSColor.green.opacity(0.12))
                    .clipShape(RoundedRectangle(cornerRadius: 12))
            }

            HStack(spacing: 8) {
                StatusPill(text: selectedClient.status, color: selectedClient.accent)
                StatusPill(text: "Human review", color: TracepadIOSColor.blue)
            }
        }
    }

    private var clientPicker: some View {
        VStack(alignment: .leading, spacing: 10) {
            SectionLabel("Active client")
            Picker("Client", selection: $selectedClient) {
                ForEach(FieldClient.allCases) { client in
                    Text(client.title).tag(client)
                }
            }
            .pickerStyle(.segmented)
            .onChange(of: selectedClient) { _, newClient in
                noteText = newClient.seedNote
                draftReady = true
            }
        }
    }

    private var capturePanel: some View {
        VStack(alignment: .leading, spacing: 14) {
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text(selectedClient.subtitle)
                        .font(.headline)
                        .foregroundStyle(TracepadIOSColor.ink)
                    Text("Capture note")
                        .font(.caption.weight(.semibold))
                        .foregroundStyle(TracepadIOSColor.blue)
                }
                Spacer()
                Button {
                    recording.toggle()
                } label: {
                    Image(systemName: recording ? "stop.fill" : "mic.fill")
                        .font(.headline)
                        .foregroundStyle(recording ? Color.white : TracepadIOSColor.green)
                        .frame(width: 42, height: 42)
                        .background(recording ? TracepadIOSColor.green : TracepadIOSColor.green.opacity(0.12))
                        .clipShape(Circle())
                }
                .accessibilityLabel(recording ? "Stop recording" : "Start recording")
            }

            TextEditor(text: $noteText)
                .frame(minHeight: 128)
                .font(.body)
                .foregroundStyle(TracepadIOSColor.ink)
                .scrollContentBackground(.hidden)
                .padding(12)
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(TracepadIOSColor.border, lineWidth: 1)
                )

            HStack(spacing: 10) {
                Toggle(isOn: $includePhotos) {
                    Label("Photo set", systemImage: "photo.on.rectangle")
                        .font(.subheadline.weight(.semibold))
                }
                .toggleStyle(.switch)

                Spacer()

                Button {
                    draftReady = true
                } label: {
                    Label("Generate", systemImage: "sparkles")
                        .font(.subheadline.weight(.bold))
                }
                .buttonStyle(.borderedProminent)
            }
        }
        .card()
    }

    private var evidenceStrip: some View {
        VStack(alignment: .leading, spacing: 10) {
            SectionLabel("Evidence")
            HStack(spacing: 10) {
                MetricTile(value: "\(selectedClient.photos)", label: "Photos", icon: "photo")
                MetricTile(value: "\(selectedClient.tasks.count)", label: "Tasks", icon: "checklist")
                MetricTile(value: "\(selectedClient.confidence)%", label: "Confidence", icon: "checkmark.seal")
            }
        }
    }

    private var reviewDraft: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Label("Review draft", systemImage: draftReady ? "checkmark.seal.fill" : "doc.text")
                    .font(.headline)
                    .foregroundStyle(TracepadIOSColor.ink)
                Spacer()
                Text(selectedClient.due)
                    .font(.caption.weight(.bold))
                    .foregroundStyle(TracepadIOSColor.ink)
                    .padding(.horizontal, 9)
                    .padding(.vertical, 5)
                    .background(TracepadIOSColor.amber.opacity(0.16))
                    .clipShape(Capsule())
            }

            Text(selectedClient.draft)
                .font(.subheadline)
                .foregroundStyle(TracepadIOSColor.ink)
                .lineSpacing(3)
                .fixedSize(horizontal: false, vertical: true)

            VStack(alignment: .leading, spacing: 8) {
                ForEach(selectedClient.tasks, id: \.self) { task in
                    Label(task, systemImage: "checkmark.circle.fill")
                        .font(.subheadline)
                        .foregroundStyle(TracepadIOSColor.ink)
                        .labelStyle(.titleAndIcon)
                }
            }
        }
        .card()
    }

    private var portalPackage: some View {
        VStack(alignment: .leading, spacing: 12) {
            SectionLabel("Portal package")
            ForEach(selectedClient.packageItems, id: \.self) { item in
                HStack(spacing: 10) {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundStyle(TracepadIOSColor.green)
                    Text(item)
                        .font(.subheadline)
                        .foregroundStyle(TracepadIOSColor.ink)
                    Spacer()
                }
            }

            Button {
                draftReady = true
            } label: {
                Label("Finalize for review", systemImage: "paperplane.fill")
                    .font(.headline)
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            .padding(.top, 4)
        }
        .card()
    }
}

private struct MetricTile: View {
    let value: String
    let label: String
    let icon: String

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Image(systemName: icon)
                .foregroundStyle(TracepadIOSColor.green)
            Text(value)
                .font(.title3.weight(.bold))
                .foregroundStyle(TracepadIOSColor.ink)
            Text(label)
                .font(.caption.weight(.semibold))
                .foregroundStyle(TracepadIOSColor.muted)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(12)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(TracepadIOSColor.border, lineWidth: 1)
        )
    }
}

private struct StatusPill: View {
    let text: String
    let color: Color

    var body: some View {
        Text(text)
            .font(.caption.weight(.bold))
            .foregroundStyle(TracepadIOSColor.ink)
            .padding(.horizontal, 10)
            .padding(.vertical, 6)
            .background(color.opacity(0.16))
            .clipShape(Capsule())
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
            .foregroundStyle(TracepadIOSColor.blue)
            .textCase(.uppercase)
    }
}

private struct CardModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(16)
            .background(TracepadIOSColor.paper)
            .clipShape(RoundedRectangle(cornerRadius: 14))
            .overlay(
                RoundedRectangle(cornerRadius: 14)
                    .stroke(TracepadIOSColor.border, lineWidth: 1)
            )
    }
}

private struct CompactNavigationTitleModifier: ViewModifier {
    func body(content: Content) -> some View {
        #if os(iOS)
        content.navigationBarTitleDisplayMode(.inline)
        #else
        content
        #endif
    }
}

private extension View {
    func card() -> some View {
        modifier(CardModifier())
    }
}

private enum TracepadIOSColor {
    static let ink = Color(red: 0.125, green: 0.145, blue: 0.169)
    static let canvas = Color(red: 0.957, green: 0.949, blue: 0.929)
    static let paper = Color(red: 1.0, green: 0.992, blue: 0.972)
    static let green = Color(red: 0.114, green: 0.710, blue: 0.424)
    static let blue = Color(red: 0.365, green: 0.498, blue: 0.639)
    static let amber = Color(red: 0.784, green: 0.541, blue: 0.208)
    static let muted = Color(red: 0.392, green: 0.420, blue: 0.400)
    static let border = Color(red: 0.845, green: 0.824, blue: 0.776)
}

public enum FieldClient: String, CaseIterable, Identifiable {
    case harbor
    case cedar
    case northline

    public var id: String { rawValue }

    var title: String {
        switch self {
        case .harbor: "Harbor"
        case .cedar: "Cedar"
        case .northline: "Northline"
        }
    }

    var subtitle: String {
        switch self {
        case .harbor: "Harbor Ridge Retrofit"
        case .cedar: "Cedar Works Audit"
        case .northline: "Northline Implementation"
        }
    }

    var status: String {
        switch self {
        case .harbor: "Ready to draft"
        case .cedar: "Owner review"
        case .northline: "Scope update"
        }
    }

    var due: String {
        switch self {
        case .harbor: "Due Friday"
        case .cedar: "Due Monday"
        case .northline: "Due tomorrow"
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
        case .harbor: TracepadIOSColor.green
        case .cedar: TracepadIOSColor.amber
        case .northline: TracepadIOSColor.blue
        }
    }

    var seedNote: String {
        switch self {
        case .harbor:
            "North wing roof membrane inspection. HVAC curb flashing has early wear. Client asked if repair can be bundled into May maintenance."
        case .cedar:
            "Compliance site walk found three remediation items: label replacement, access panel clearance, and updated signage. Operations needs clear owners."
        case .northline:
            "Phase two rollout expanded to four sites. Client wants training sequence and support handoff confirmed before proposal delivery."
        }
    }

    var draft: String {
        switch self {
        case .harbor:
            "The north wing roof membrane is intact overall, with early wear near the HVAC curb. Recommend a targeted seam repair during the May maintenance window, with photos attached for warranty review."
        case .cedar:
            "Cedar Works has three open remediation items. The client-ready summary should separate required compliance work from optional maintenance and assign each item to an owner."
        case .northline:
            "Northline is ready for phase-two planning once training and support ownership are confirmed. The proposal should reflect the expanded four-site scope."
        }
    }

    var tasks: [String] {
        switch self {
        case .harbor:
            ["Confirm warranty language", "Schedule seam repair", "Attach photo appendix"]
        case .cedar:
            ["Assign remediation owners", "Add compliance deadline", "Send risk summary"]
        case .northline:
            ["Update scope table", "Confirm training owner", "Send Friday follow-up"]
        }
    }

    var packageItems: [String] {
        ["Client summary", "Evidence appendix", "Internal tasks", "Reviewer note"]
    }
}

#Preview {
    TracepadCaptureRootView()
}
