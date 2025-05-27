# CSS nesting

You can nest css selectors:

```css
.my-element {
  a {
  }

  :is(a, button) {
  }

  .button {
  }

  [data-type] {
  }

  + .another-element {
  }
}
```

A possible gotcha with nesting selectors is that a space character is added
between the top-level selector and the nested selector.

When you intend to have the nested selector be appended to the top-level
selector, the use of the `&` enables that result.

```css
.my-element {
  [data-type] {
  }

  &[data-type] {
  }
}

/* Results in: */
.my-element [data-type] {
}
.my-element[data-type] {
}
```
