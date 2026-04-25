import fs from "node:fs/promises";
import path from "node:path";

const root = process.cwd();
const src = path.join(root, "apps/web/src");
const publicDir = path.join(root, "apps/web/public");
const dist = path.join(root, "apps/web/dist");

async function copyDir(from, to) {
  await fs.mkdir(to, { recursive: true });
  for (const entry of await fs.readdir(from, { withFileTypes: true })) {
    const source = path.join(from, entry.name);
    const target = path.join(to, entry.name);
    if (entry.isDirectory()) await copyDir(source, target);
    else await fs.copyFile(source, target);
  }
}

await fs.rm(dist, { recursive: true, force: true });
await copyDir(src, dist);
await copyDir(publicDir, dist);
console.log(`Built Tracepad web app to ${dist}`);
