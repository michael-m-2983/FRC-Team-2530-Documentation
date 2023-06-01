import std.stdio : writeln, writefln;
import std.file, std.format, std.string, std.conv;

import commonmarkd; // For markdown -> html
import html; // for fixing links

const MarkdownFlag flags =
	MarkdownFlag.enableStrikeThrough +
	MarkdownFlag.enableTaskLists +
	MarkdownFlag.permissiveAutoLinks +
	MarkdownFlag.dialectGitHub;

void main()
{
	// Make sure everything exists
	assert(exists("docs") && isDir("docs"));
	assert(exists("static") && isDir("static"));
	if (!exists("output"))
		mkdir("output");

	// Clear /output
	foreach (entry; dirEntries("output", SpanMode.depth))
		remove(entry);

	foreach (entry; dirEntries("docs", SpanMode.breadth))
	{
		if (!isFile(entry))
			continue;
		string content = format(readText("template.html"), convertMarkdownToHTML(readText(entry), flags));

		auto doc = createDocument(content);

		const char[] tName = "a";

		foreach(a; doc.elementsByTagName(tName)) {
			string href = to!string(a["href"]);
			
			if(href.startsWith("/")) {
				href = "https://michael-m-2983.github.io/FRC-Team-2530-Documentation" ~ href;
			}

			a["href"] = href;
		}


		if(entry == "docs/index.md" || entry == "index.md") {
			const char[] tName2 = "li";

			foreach(li; doc.elementsByTagName(tName2)) {
				li["class"] = "weirdo";
			}

		}
		


		// <a href="/programming/Laptop-Rules">

		content = to!string(doc.root.html);
		

		mkdirRecurse("output" ~ entry["docs".length .. $ - ".md".length]);
		write("output" ~ entry["docs".length .. $ - ".md".length] ~ "/index.html", content);
	}

	// For convenience
	copy("output/index/index.html", "output/index.html");

	foreach (entry; dirEntries("static", SpanMode.breadth))
		copy(entry, "output" ~ entry["static".length .. $]);

	writeln("Finished!");
}
