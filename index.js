import * as fs from "fs/promises";
import jsonfile from "jsonfile";
import Handlebars from "handlebars";
import {minify} from "html-minifier-terser";

const template = await fs.readFile("template.hbs", "utf-8");
const render = Handlebars.compile(template);
const options = {
    minifyJS: true,
    minifyCSS: true,
    removeComments: true,
    collapseWhitespace: true,
};

const readJson = async () => jsonfile.readFile("pages.json");
const createPages = async (pages) => {
    for (const page of pages) {
        const content = await minify(render(page), options);
        await fs.writeFile(`html/${page.status}.html`, content);
    }
};

fs.mkdir("html", { recursive: true })
    .then(readJson)
    .then(createPages);
