#import "@preview/touying:0.6.1": *
#import "@preview/colorful-boxes:1.3.1": *
#import "@preview/fletcher:0.5.5" as fletcher: diagram, node, edge
#import fletcher.shapes: diamond, ellipse
#import "@preview/numbly:0.1.0": numbly
#import themes.university: *
#import "@preview/codly:1.3.0": *
#import "@preview/codly-languages:0.1.10": *

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
    config-info(
      title: [Programmierung 1 (IKG)],
      date: "SoSe 26",
      institution: "HTW Berlin",
      author: "Prof. Dr.-Ing. P. W. Dabrowski"
    ),
    config-colors(
      primary: rgb("#76b900"),
      secondary: rgb("#0082D1"),
      tertiary: rgb("#FF5F00"),
      neutral-lightest: rgb("#ffffff"),
      neutral-darkest: rgb("#000000"),
    )
  )

  show link: underline

  title-slide()


  set text(
    hyphenate: true,
    lang: "de"
  )

  show: university-theme.with(
    color-a: rgb("#76B900"),
    color-b: rgb("#0082D1"),
    color-c: rgb("#EDf5DF"),
    short-title: "Programmierung 1 IKG",
    short-date: "WiSe 24/25"
  )

  show link: underline
  show raw: set text(size: 14pt)

  body
}


