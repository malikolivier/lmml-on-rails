# Hacking on `lmml-on-rails`

This architecture is similar to a standard `rails` project.
Reading "The Rails Way" and applying its principle would be a plus.

# DB structure

You can get an idea of the DB structure by looking at an LMML file
(in JSON or XML format).
After running the server, you can see the content of an LMML file
from any of the following links:

- JSON: http://localhost:3000/autopsies/979617184/lmml_file
- XML: http://localhost:3000/autopsies/979617184/lmml_file.xml

```
                            /-> (n) Injury
                           /    /-- (1) Note
                          (1) (1)
Autopsy (1) <-> (n) Examinations <-> ExternalOutlineExamination
          |                      \-> ExternalHeadExamination
          |                      \-> ...
          |                      \-> InternalNeckOrgansExamination
          |                      \-> InternalHeartExamination
          |                      \-> ...
          \---> (n) Analyses     <-> AnalysisBiochemetry
                                 \-> AnalysisEthanol
                                 \-> ...
```

The most important models and their relations are written above.

Output text of LMML data:

- Browse: http://localhost:3000/autopsies/979617184/browse

# Code structure

## Front-end JS

Use Vue.js for templating.

Espacially, all examinations and analyses' templates are
automatically generated using an instance of VueFormBuilder.

A typical form using VueFormBuilder is built with the following
files:
- `app/views/autopsies/external/*_form.html.haml`:
  Define the layout of the form.
- `app/assets/javascripts/external_examinations/*.js`:
  Conditionally call code in `load-vue-models.js` to instantiate
  Vue instance.

## Back-end

### Class hierarchy in models

```
ApplicationRecord <- (Most records directly derive from ApplicationRecord)
                  \- ExaminationBase <- ExternalOutlineExamination
                                     \- ... (Most examinations are here)
                                     \- DualExaminationBase <- InternalLungsExamination
                                                            \- ... (Most examinations with two symmetrical organs go here)
```

There are two kinds of examinations:
- Single Examination: Derive directly from ExaminationBase.
- Dual Examination: Derive from DualExaminationBase. These
are the examinations of two symmetrical organs. What this

### Text generation / I18n

Text generation is handled by instances of classes derived from
`ApplicationDecorator`.

All translations can be found in `config/locales/*.yml`.

### Routes

There are two kinds of routes:
- API routes: These routes start from /api/ and mainly return JSON.
  They are to be used by external services for interaction with the LMML server.
  These routes are also used for dynamic content generation in the
  `lmml-on-rails` interface.
  API doc can be found here: http://localhost:3000/docs.
- Application routes: These are the other routes use for standard web browsing.
  They include autopsy browsing and editing.
