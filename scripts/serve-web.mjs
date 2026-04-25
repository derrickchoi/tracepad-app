import http from "node:http";
import fs from "node:fs/promises";
import path from "node:path";

const root = path.join(process.cwd(), "apps/web/dist");
const port = Number(process.env.PORT || 4173);
const types = {
  ".html": "text/html; charset=utf-8",
  ".css": "text/css; charset=utf-8",
  ".js": "text/javascript; charset=utf-8",
  ".svg": "image/svg+xml",
  ".png": "image/png"
};

const server = http.createServer(async (req, res) => {
  const urlPath = decodeURIComponent(new URL(req.url, `http://localhost:${port}`).pathname);
  const filePath = path.join(root, urlPath === "/" ? "index.html" : urlPath);
  if (!filePath.startsWith(root)) {
    res.writeHead(403);
    res.end("Forbidden");
    return;
  }
  try {
    const data = await fs.readFile(filePath);
    res.writeHead(200, { "Content-Type": types[path.extname(filePath)] || "application/octet-stream" });
    res.end(data);
  } catch {
    const index = await fs.readFile(path.join(root, "index.html"));
    res.writeHead(200, { "Content-Type": types[".html"] });
    res.end(index);
  }
});

server.listen(port, () => console.log(`Tracepad web app: http://localhost:${port}`));
