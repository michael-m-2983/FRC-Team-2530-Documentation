# How the documentation works

To start, the program checks if everything exists and is working. Then it deletes the `output` directory. After that, it loops through every file in the `docs` directory and converts it to HTML, and fixes its links. Once this is done, the program copies static files to `output`, and copies the index file to another location, which allows the user to just go to `https://michael-m-2983.github.io/FRC-Team-2530-Documentation/` instead of `https://michael-m-2983.github.io/FRC-Team-2530-Documentation/index/`.

### Hosting
For hosting, this project uses [Github Actions](https://github.com/features/actions), [Github Pages](https://pages.github.com/), and [github-pages-overwriter](https://github.com/rayluo/github-pages-overwriter) to run the generator, move the contents of `output/` to a new branch `gh-pages` and then publish the GitHub pages site. If you want to know more about this, a good place to start would be the projects [publish workflow](https://github.com/michael-m-2983/FRC-Team-2530-Documentation/blob/master/.github/workflows/publish.yml).

### Libraries
The static site generator uses [commonmark-d](https://code.dlang.org/packages/commonmark-d) to convert the markdown files from `docs` into HTML. [htmld](https://code.dlang.org/packages/htmld) is used to append the full URL to every link that starts with '/'.

### Frontend stuff
For syntax highlighting, this project uses [PrismJS](https://prismjs.com/). Other than that, all of it is just raw HTML/CSS/JS.

### Folder overviews
| Folder | Description |
| ------ | ----------- |
| `.github/` | Github actions workflow |
| `docs/` | All of the actual documentation/markdown goes here. |
| `output/` | The generated webpage will be here once you run this. Note: all files in here are automatically deleted when the generator runs. |
| `src/` | This is where the code for the generator is. |
| `static/` | non-markdown related files. e.g. stylesheets, scripts, images. |