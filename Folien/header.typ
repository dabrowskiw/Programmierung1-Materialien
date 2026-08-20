#import "@preview/touying:0.6.1": *
#import "@preview/colorful-boxes:1.3.1": *
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#import fletcher.shapes: diamond, ellipse
#import "@preview/numbly:0.1.0": numbly
#import themes.university: *
#import "@preview/codly:1.3.0": *
#import "@preview/codly-languages:0.1.10": *
#import "@preview/thmbox:0.3.0": *

#let htwslides(body) = {
  show: codly-init
  show: thmbox-init()
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
      primary: rgb("#76b900"),
      secondary: rgb("#0082D1"),
      tertiary: rgb("#FF5F00"),
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


