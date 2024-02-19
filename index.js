import * as fs from "fs/promises";
import jsonfile from "jsonfile";
import Handlebars from "handlebars";
import { minify } from "html-minifier-terser";

const encoding = "utf-8";
const template = await fs.readFile("template.hbs", encoding);
const render = Handlebars.compile(template);
const options = {
    minifyJS: true,
    minifyCSS: true,
    removeComments: true,
    collapseWhitespace: true,
};

const minifyFile = async (content) => minify(content, options);
const writeToFile = async (minified) => fs.writeFile("html/index.html", minified);
const readJson = async () => jsonfile.readFile("pages.json");
const createPages = async (pages) => {
    for (const page of pages) {
        const content = render(page);
        const minified = await minifyFile(content);
        await fs.writeFile(`html/${page.status}.html`, minified);
    }
};

await fs.mkdir("html", { recursive: true })
    .then(readJson)
    .then(createPages);

await fs.readFile("index.html", encoding)
    .then(minifyFile)
    .then(writeToFile);
