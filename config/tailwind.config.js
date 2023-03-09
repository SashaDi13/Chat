const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}'
  ],
  theme: {
    extend: {
      content: {
        'empty': '',
      },
      fontFamily: {
        sans: ['Open Sans', ...defaultTheme.fontFamily.sans],
        'proxima-nova': ['Proxima Nova'],
      },
      colors: {
        'footer-gray':   '#797B89',
        'liberty-blue':  '#4d5eac',
        'charcoal-gray': '#343A4F',
        'yankees-blue':  '#252838',
        'ultramarine-blue': '#3369F3',
        'celtic-blue': '#2D5EDA',
        'manatee-purple': '#9898B0',
        'platinum': '#E2E2E4',
        'indepence-blue': '#4C546F',
        'rhythm-gray': '#717790'
      },
      padding: {
        '1.25': '0.315rem',
        '1.75': '0.435rem',
        '7.5': '1.875rem',
      },
      lineHeight: {
        70: '4.375rem',
      },
      width: {
        'unset': 'unset',
        '98': '30.5rem'
      },
      maxWidth: {
        '90': '90rem',
      },
      boxShadow: {
        'medium-bottom': '0px 14px 34px rgba(0, 0, 0, 0.25)',
        'strong-bottom': '0px 14px 34px rgba(0, 0, 0, 0.3)',
      },
      backgroundImage: {
        'card-hover': "linear-gradient( rgba(0, 0, 0, 0.4), rgba(0, 0, 0, 0.4) )",
      },
      margin: {
        '7.5': '1.875rem',
      },
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography'),
    require('tailwind-scrollbar'),
  ]
}
