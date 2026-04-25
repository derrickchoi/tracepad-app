from pathlib import Path
import subprocess
from PIL import Image, ImageDraw, ImageFont

ROOT = Path(__file__).resolve().parents[1]
frames = ROOT / "output/video/frames"
out = ROOT / "output/video/tracepad-pitch.mp4"
frames.mkdir(parents=True, exist_ok=True)

slides = [
    ("Tracepad.ai", "Capture the work. Ship the report."),
    ("The problem", "Field work gets trapped in voice notes, photos, texts, and memory."),
    ("The workflow", "Capture -> Organize -> Generate -> Review -> Deliver"),
    ("The product", "iOS capture, web workspace, and macOS review studio."),
    ("The traction model", "3 pilots / 9 paying teams / 42 active seats / $3.2k MRR"),
    ("The ask", "$1.5M seed to harden product and convert pilots."),
]

try:
    title_font = ImageFont.truetype("/System/Library/Fonts/Supplemental/Arial Bold.ttf", 86)
    body_font = ImageFont.truetype("/System/Library/Fonts/Supplemental/Arial.ttf", 42)
except Exception:
    title_font = body_font = None

for i, (title, body) in enumerate(slides):
    for repeat in range(45):
        frame_no = i * 45 + repeat
        img = Image.new("RGB", (1920, 1080), "#F4F2ED")
        draw = ImageDraw.Draw(img)
        draw.rectangle((0, 0, 22 + repeat * 8, 1080), fill="#1DB56C")
        draw.text((150, 300), title, fill="#20252B", font=title_font)
        draw.text((155, 430), body, fill="#5D7FA3", font=body_font)
        draw.text((155, 900), "Tracepad.ai / Seed package", fill="#C88A35", font=body_font)
        img.save(frames / f"frame_{frame_no:04d}.png")

cmd = [
    "ffmpeg", "-y", "-framerate", "30", "-i", str(frames / "frame_%04d.png"),
    "-c:v", "libx264", "-pix_fmt", "yuv420p", "-movflags", "+faststart", str(out)
]
subprocess.run(cmd, check=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
print(out)
