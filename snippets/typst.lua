-- Typst snippets (s, t, i, fmta... are provided by the LuaSnip lua loader)
return {
    s({ trig = "fig", desc = "Figure with image, caption and label" }, fmta([[
#figure(
  image("<>", width: <>%),
  caption: [<>],
) <<fig:<>>>
<>]], { i(1, "path.png"), i(2, "80"), i(3, "Caption"), i(4, "label"), i(0) })),

    s({ trig = "tab", desc = "Table figure" }, fmta([[
#figure(
  table(
    columns: <>,
    table.header[<>][<>],
    [<>], [<>],
  ),
  caption: [<>],
) <<tab:<>>>
<>]], { i(1, "2"), i(2, "A"), i(3, "B"), i(4), i(5), i(6, "Caption"), i(7, "label"), i(0) })),

    s({ trig = "eq", desc = "Numbered display equation with label" }, fmta([[
$ <> $ <<eq:<>>>
<>]], { i(1), i(2, "label"), i(0) })),

    s({ trig = "mm", desc = "Inline math" }, fmta("$<>$<>", { i(1), i(0) })),

    s({ trig = "ref", desc = "Reference a label" }, fmta("@<>:<>", { c(1, { t("fig"), t("tab"), t("eq"), t("sec") }), i(2) })),

    s({ trig = "h1", desc = "Heading with label" }, fmta("= <> <<sec:<>>>\n\n<>", { i(1, "Title"), i(2, "label"), i(0) })),
    s({ trig = "h2", desc = "Subheading with label" }, fmta("== <> <<sec:<>>>\n\n<>", { i(1, "Title"), i(2, "label"), i(0) })),

    s({ trig = "inc", desc = "Include a chapter file" }, fmta('#include "<>.typ"', { i(1, "chapters/") })),

    s({ trig = "cite", desc = "Citation" }, fmta("#cite(<<<>>>)", { i(1, "key") })),

    s({ trig = "note", desc = "Footnote" }, fmta("#footnote[<>]", { i(1) })),

    s({ trig = "todo", desc = "Visible TODO marker" }, fmta('#text(fill: red)[TODO: <>]', { i(1) })),
}
