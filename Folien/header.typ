#import "@preview/touying:0.6.1": *
#import "@preview/colorful-boxes:1.3.1": *
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#import fletcher.shapes: diamond, ellipse
#import "@preview/numbly:0.1.0": numbly
#import themes.university: *
#import "@preview/codly:1.3.0": *
#import "@preview/codly-languages:0.1.10": *
#import "@preview/gentle-clues:1.3.1": *

#let diagram = touying-reducer.with(
  reduce: fletcher.diagram,
  cover: fletcher.hide,
)

#let hlnode(enc, col: blue.lighten(90%)) = node(
      enclose: enc,
      inset: 10pt,
      snap: false,
      stroke: blue + 1pt,
      fill: col,
    )

#let colorsPrimary = rgb("#76b900")

#let colorsSecondary = rgb("#0082D1")

#let colorsTertiary = rgb("#FF5F00")


#let htwslides(body) = {
  show: codly-init

  codly(
    languages: codly-languages,
    inset: 0.15em,
  )

  set text(
    hyphenate: true,
    lang: "de"
  )

  show: university-theme.with(
    aspect-ratio: "16-9",
    short-title: "Programmierung 1 IKG",
    short-date: "WiSe 26/27",
    author: "Prof. Dr.-Ing. Piotr Wojciech Dabrowski",
    config-colors(
      primary: colorsPrimary,
      secondary: colorsSecondary,
      tertiary: colorsTertiary,
      neutral-lightest: rgb("#ffffff"),
      neutral-darkest: rgb("#000000"),
    )
  )

  show link: underline

  set text(
    hyphenate: true,
    lang: "de"
  )


  show link: underline
  show raw: set text(size: 14pt)

  body
}


