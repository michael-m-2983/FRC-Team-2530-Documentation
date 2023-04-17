# FRC-Team-2530-Documentation
The Documentation website.

### Details
It converts the markdown in `/docs` to html, and then uses https://github.com/marketplace/actions/github-pages-overwriter to deploy to github-pages.

### Development
If you want to work on this project, [http-server](https://www.npmjs.com/package/http-server) is highly recommended. 

```bash
dub # To generate the site in /output
http-server output/ # To run the server
```