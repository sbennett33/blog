module.exports = {
  mode: "jit",
  content: ["./js/**/*.js", "../lib/*_web/**/*.*ex"],
  theme: {
    extend: {
      typography: (theme) => ({
        DEFAULT: {
          css: {
            hr: {
              borderColor: theme("colors.zinc.800"),
              borderTopWidth: 2,
            },
            thead: {
              borderBottomColor: theme("colors.zinc.800"),
              borderBottomWidth: 2,
            },
            "thead th": {
              textTransform: "uppercase",
            },
            "tbody tr": {
              borderBottomColor: theme("colors.zinc.600"),
            },
            "ul > li::marker": {
              color: theme("colors.zinc.600"),
            },
          },
        },
      }),
    },
  },
  variants: {
    extend: {},
  },
  plugins: [require("@tailwindcss/typography")],
};
