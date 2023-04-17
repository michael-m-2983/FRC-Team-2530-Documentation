import std.stdio : writeln;
import std.file, std.format, std.string;

import commonmarkd; // For markdown -> html

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
		if(!isFile(entry)) continue;
		string content;

		content ~= format(readText("template.html"), convertMarkdownToHTML(readText(entry), flags));

		mkdirRecurse("output" ~ entry["docs".length .. $ - ".md".length]);
		write("output" ~ entry["docs".length .. $ - ".md".length] ~ "/index.html", content);
	}

	// For convenience
	copy("output/index/index.html", "output/index.html");

	foreach (entry; dirEntries("static", SpanMode.breadth))
		copy(entry, "output" ~ entry["static".length .. $]);

	writeln("Finished!");

}