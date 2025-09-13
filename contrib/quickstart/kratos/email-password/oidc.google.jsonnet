local claims = {
  email_verified: false
} + std.extVar('claims');

{
  identity: {
    traits: {
      // This part maps the email if it's verified by GitHub.
      [if "email" in claims && claims.email_verified then "email" else null]: claims.email,
      display_name: claims.name
    },
  },
}