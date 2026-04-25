import React from "react";
import { AbsoluteFill, interpolate, useCurrentFrame } from "remotion";

const palette = {
  graphite: "#20252B",
  canvas: "#F4F2ED",
  green: "#1DB56C",
  blue: "#5D7FA3",
  amber: "#C88A35"
};

export function TracepadPitch() {
  const frame = useCurrentFrame();
  const progress = interpolate(frame, [0, 180], [0, 1], { extrapolateRight: "clamp" });
  return (
    <AbsoluteFill style={{ background: palette.canvas, color: palette.graphite, fontFamily: "Inter, sans-serif", padding: 72 }}>
      <div style={{ fontSize: 32, color: palette.blue, fontWeight: 800 }}>Tracepad.ai</div>
      <div style={{ fontSize: 92, lineHeight: 0.94, fontWeight: 900, maxWidth: 920, marginTop: 40 }}>
        Capture the work. Ship the report.
      </div>
      <div style={{ marginTop: 44, width: 980, height: 10, background: "rgba(32,37,43,.13)" }}>
        <div style={{ width: `${progress * 100}%`, height: "100%", background: palette.green }} />
      </div>
      <div style={{ display: "flex", gap: 28, marginTop: 58, fontSize: 28, fontWeight: 700 }}>
        {["Capture", "Organize", "Generate", "Review", "Deliver"].map((step, index) => (
          <div key={step} style={{ opacity: progress > index / 5 ? 1 : 0.32 }}>{step}</div>
        ))}
      </div>
      <div style={{ position: "absolute", right: 72, bottom: 72, fontSize: 26, color: palette.amber }}>
        $1.5M seed / 3 pilots / 9 paying teams
      </div>
    </AbsoluteFill>
  );
}
