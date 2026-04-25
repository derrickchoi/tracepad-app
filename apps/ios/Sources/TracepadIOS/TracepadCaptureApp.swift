import SwiftUI

public struct TracepadCaptureRootView: View {
    @State private var selectedClient = "Harbor Ridge Retrofit"
    @State private var noteText = "North wing roof membrane inspection. HVAC curb flashing needs follow-up."
    @State private var includePhotos = true
    @State private var draftReady = false

    public init() {}

    public var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    header
                    captureCard
                    draftCard
                    taskList
                }
                .padding()
            }
            .background(Color(red: 0.957, green: 0.949, blue: 0.929))
            .navigationTitle("Tracepad Capture")
        }
    }

    private var header: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Capture the work.")
                .font(.largeTitle.weight(.bold))
                .foregroundStyle(Color(red: 0.125, green: 0.145, blue: 0.169))
            Text("Voice, photos, client context, and task hints stay tied to the deliverable.")
                .font(.body)
                .foregroundStyle(.secondary)
        }
    }

    private var captureCard: some View {
        VStack(alignment: .leading, spacing: 14) {
            Picker("Client", selection: $selectedClient) {
                Text("Harbor Ridge Retrofit").tag("Harbor Ridge Retrofit")
                Text("Cedar Works Audit").tag("Cedar Works Audit")
                Text("Northline Implementation").tag("Northline Implementation")
            }
            .pickerStyle(.menu)

            TextEditor(text: $noteText)
                .frame(minHeight: 150)
                .padding(8)
                .background(.background)
                .clipShape(RoundedRectangle(cornerRadius: 8))

            Toggle("Attach photo set", isOn: $includePhotos)

            Button {
                draftReady = true
            } label: {
                Label("Generate field summary", systemImage: "sparkles")
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            .tint(Color(red: 0.114, green: 0.710, blue: 0.424))
        }
        .padding()
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }

    private var draftCard: some View {
        VStack(alignment: .leading, spacing: 10) {
            Label("Draft", systemImage: draftReady ? "checkmark.seal.fill" : "doc.text")
                .font(.headline)
            Text(draftReady ? "Client-ready recap generated for \(selectedClient). Evidence remains attached for review." : "Capture a field note to generate a reviewable draft.")
                .foregroundStyle(.secondary)
        }
        .padding()
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }

    private var taskList: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Detected follow-ups")
                .font(.headline)
            ForEach(["Confirm warranty language", "Schedule seam repair", "Send recap by Friday"], id: \.self) { task in
                Label(task, systemImage: "checklist")
                    .foregroundStyle(Color(red: 0.125, green: 0.145, blue: 0.169))
            }
        }
        .padding()
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}

#Preview {
    TracepadCaptureRootView()
}
